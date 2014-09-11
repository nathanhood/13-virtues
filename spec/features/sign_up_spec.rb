## User creates an account with email

# As a user,
# in order to begin using the website,
# I want to create an account
#
# **Usage:**
# 1. On homepage, click "Sign Up"
#
# 2. Fill out form
#   * name
#   * email
#   * password
#   * password confirmation
#   * optional image upload
#
# 3. Promoter sees profile page
#
# **Acceptance Criteria**
# * User enters valid input to create new user
#   * validate if email is not a duplicate
#   * validate if email is an email
#   * validate if passwords match
#   * validate if password is at least 6 characters
#   * validate if photo is either empty or a photo link
#   * ensure that photo is saved at a file size of no larger than 100kb
# * User is saved to the database through the user model with:
#   * Name
#   * Email
#   * Photo Link
#   * Password


feature "Sign Up" do

  background do
    # @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Sign Up"
  end

  scenario "with empty input fields" do

    click_on "Create Account"
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
    expect(page).to have_css("p.error_notification")
    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("can't be blank")
    expect(current_path).to eq(user_registration_path)
  end

  scenario "with invalid information" do
    fill_in "Email", with: "Example User"
    Capybara.exact = true
    fill_in "* Password", with: "aaaaaa"
    Capybara.exact = false
    fill_in "Password Confirmation", with: "aaaaaa"
    click_on "Create Account"
    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("is invalid")
    expect(page).to have_content("is too short (minimum is 8 characters)")
    expect(current_path).to eq(user_registration_path)
  end

  scenario "with valid information" do
    fill_in "Email", with: "example@thirteen.com"
    Capybara.exact = true
    fill_in "* Password", with: "aaaaaaaa"
    Capybara.exact = false
    fill_in "Password Confirmation", with: "aaaaaaaa"
    expect{ click_button "Create Account" }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome")
    expect(current_path).to eq(profile_path)
  end
end
