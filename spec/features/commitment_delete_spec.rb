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

  scenario "should have proper delete button", js:true do
    click_on "Virtues"
    expect(page).to have_css(".delete-#{@commitment.id}")
  end

  scenario "should successfully delete commitment", js:true do
    click_on "Virtues"
    find(".delete-#{@commitment.id}").click
    expect(current_path).to eq(virtues_path)
    expect(page).to have_content(@commitment2.description)
    expect(page).to have_content(@virtue2.name)
    expect(page).to have_content("#{@virtue.name} has been deleted")
    expect(page).not_to have_css(".delete-#{@commitment.id}")
  end
end
