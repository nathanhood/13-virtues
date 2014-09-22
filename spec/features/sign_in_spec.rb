feature "Sign In" do

  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Sign In"
  end

  scenario "with valid information" do
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
    # expect(page).to have_content("Welcome back")
    expect(page).to have_content("Sign Out")
    expect(current_path).to eq(profile_path)
  end

  scenario "with invalid information" do
    fill_in "Email", with: "invalid@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
    expect(page).to have_content("Sign In")
    expect(page).to have_css("a", text: "Sign In")
    expect(page).to have_content("Invalid email address or password")
    expect(current_path).to eq(new_user_session_path)
  end

end
