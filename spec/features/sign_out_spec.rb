feature "Sign Out" do

  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "successful logout" do
    click_on "Sign Out"
    expect(current_path).to eq(new_user_session_path)
  end
end
