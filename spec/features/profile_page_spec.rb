feature "profile page" do

  background do
    @user = FactoryGirl.create(:user)
    @virtue = FactoryGirl.create(:virtue)
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

end
