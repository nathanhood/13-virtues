feature "Add Virtue" do

  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

end
