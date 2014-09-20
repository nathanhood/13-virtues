feature "Add Virtue" do

  background do
    @user = FactoryGirl.create(:user)
    @virtue1 = FactoryGirl.create(:virtue)
    @virtue2 = FactoryGirl.create(:virtue)
    @commitment1 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue1)
    @commitment2 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue2)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
    click_on "Add Daily Report"
  end

  scenario "should create a daily report and all virtue reports", js: true do
    fill_in "Journal Entry", with: "This is a test journal entry. There are a lot of interesting things happening today"
    find("#virtue-#{@virtue1.id}-input").choose("satisfactory")
    find("#virtue-#{@virtue2.id}-input").choose("exceptional")
    click_on "Submit Report"
    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Today's report has been successfully saved!")
  end

  scenario "should not create a daily report or virtue reports - not all virtues rated" do
    fill_in "Journal Entry", with: "This is a test journal entry. There are a lot of interesting things happening today"
    find("#virtue-#{@virtue1.id}-input").choose("satisfactory")
    click_on "Submit Report"
    expect(current_path).to eq(daily_reports_path)
    expect(page).to have_content("Something went wrong, your report was not saved. Please make sure to rate yourself on all virtues.")
  end

  scenario "should create a daily report and virtue reports with empty journal entry", js: true do
    find("#virtue-#{@virtue1.id}-input").choose("satisfactory")
    find("#virtue-#{@virtue2.id}-input").choose("exceptional")
    click_on "Submit Report"
    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Today's report has been successfully saved!")
  end

end
