feature "Delete Commitment" do

  background do
    @user = FactoryGirl.create(:user)
    @virtue = FactoryGirl.create(:virtue)
    @virtue2 = FactoryGirl.create(:virtue)
    @commitment = FactoryGirl.create(:commitment, user: @user, virtue: @virtue)
    @commitment2 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue2)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "should successfully delete commitment", js:true do
    pending
    click_on "Virtues"
    first(".virtue-wrapper").click_link("Delete")
    expect(current_path).to eq(virtues_path)
    expect(page).not_to have_content(@commitment2.description)
    expect(page).not_to have_content(@virtue2.name)
    expect(page).to have_content(@virtue.name)
    expect(page).to have_content(@commitment.description)
  end
end
