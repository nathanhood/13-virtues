feature "profile page" do

  background do
    user = FactoryGirl.create(:user)
    virtue = FactoryGirl.create(:virtue)
    Commitment.create(description: "description stuff", user: user, virtue: virtue)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "when user has virtues" do
    expect(page).to have_content("Add Daily Report")
    expect(page).to_not have_content("Getting Started")
    expect(page).to_not have_css("div.getting-started")
  end
end
