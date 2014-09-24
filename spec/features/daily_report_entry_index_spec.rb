feature "daily report index" do

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

  scenario "when no daily reports have been created" do
    click_on "View Journal"
    expect(page).to have_content("No daily reports have been created.")
    expect(page).not_to have_css(".entry-records")
  end

  scenario "when daily reports have been created" do
    @daily_report = FactoryGirl.create(:daily_report, user: @user, created_at: 3.days.ago)
    @daily_report2 = FactoryGirl.create(:daily_report, user: @user, created_at: 6.days.ago)
    @virtue_report = FactoryGirl.create(:virtue_report, virtue: @virtue, daily_report: @daily_report)
    @virtue_report2 = FactoryGirl.create(:virtue_report, virtue: @virtue, daily_report: @daily_report2)
    click_on "View Journal"
    expect(page).to have_content(@daily_report.entry)
    expect(page).to have_content(@daily_report2.entry)
    expect(page).not_to have_content("No daily reports have been created.")
  end

end
