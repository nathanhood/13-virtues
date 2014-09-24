feature "profile page" do

  background do
    @user = FactoryGirl.create(:user)
    @virtue = FactoryGirl.create(:virtue, created_at: 8.days.ago)
    @commitment = FactoryGirl.create(:commitment, user: @user, virtue: @virtue)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "when user has virtues, but not daily reports", js: true do
    expect(page).to have_content("You need more data")
    expect(page).not_to have_content("Summary")
    expect(page).not_to have_content("Virtue Dashboard")
    expect(page).not_to have_content(@virtue.name)
  end

  scenario "when user has only one daily report", js: true do
    @daily_report = FactoryGirl.create(:daily_report, user: @user, created_at: 8.days.ago)
    expect(page).to have_content("You need more data")
    expect(page).not_to have_content("Summary")
    expect(page).not_to have_content("Virtue Dashboard")
    expect(page).not_to have_css(".highcharts-container")
    expect(page).not_to have_content(@virtue.name)
  end

  scenario "when user has more than one daily report that is at least four days old", js:true do
    pending "took off 7 day old min for virtues for demo"
    @daily_report = FactoryGirl.create(:daily_report, user: @user, created_at: 3.days.ago)
    @daily_report2 = FactoryGirl.create(:daily_report, user: @user, created_at: 6.days.ago)
    @virtue_report = FactoryGirl.create(:virtue_report, virtue: @virtue, daily_report: @daily_report)
    @virtue_report2 = FactoryGirl.create(:virtue_report, virtue: @virtue, daily_report: @daily_report2)
    visit "/profile"
    expect(page).to have_content("Summary")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Virtue Dashboard")
    expect(page).to have_css("#bar-graph")
    expect(page).to have_css("#main-graph")
    expect(page).to have_css("#pie-chart")
  end

  scenario "when user has created new virtue after recording daily reports previously", js: true do
    pending "took off 7 day old min for virtues for demo"
    @daily_report = FactoryGirl.create(:daily_report, user: @user, created_at: 3.days.ago)
    @daily_report2 = FactoryGirl.create(:daily_report, user: @user, created_at: 6.days.ago)
    @virtue_report = FactoryGirl.create(:virtue_report, virtue: @virtue, daily_report: @daily_report)
    @virtue_report2 = FactoryGirl.create(:virtue_report, virtue: @virtue, daily_report: @daily_report2)
    @virtue2 = FactoryGirl.create(:virtue)
    @commitment2 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue2)
    visit "/profile"
    expect(page).to have_content("Summary")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Virtue Dashboard")
    expect(page).to have_css("#bar-graph")
    expect(page).to have_css("#main-graph")
    expect(page).to have_css("#pie-chart")
    expect(page).to have_content(@virtue.name)
    expect(page).not_to have_content(@virtue2.name)
    expect(page).to have_css(".highcharts-container")
  end

end
