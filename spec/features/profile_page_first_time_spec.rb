feature "Profile Page" do

  background do
    @user = FactoryGirl.create(:user)
    @virtue = FactoryGirl.create(:virtue)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "without any virtues" do
    expect(page).to have_content("Getting Started")
    expect(page).to have_content("Add Virtues")
    expect(page).to have_content("Add your own virtues")
    expect(page).to have_content("Make daily assessments")
  end
end
