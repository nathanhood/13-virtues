feature "Add Virtue" do

  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "first virtue" do
    click_link "Add Virtues"
    expect(current_path).to eq(virtues_path)
  end

end
