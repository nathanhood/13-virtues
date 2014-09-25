feature "Edit Commitment" do

  background do
    @user = FactoryGirl.create(:user)
    @virtue = FactoryGirl.create(:virtue)
    @commitment = FactoryGirl.create(:commitment, user: @user, virtue: @virtue)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
  end

  scenario "should not edit description - blank field", js:true do
    click_on "Virtues"
    click_on "Edit"
    fill_in "Description", with: ""
    click_on "Save"
    expect(current_path).to eq(edit_commitment_path(@commitment))
    expect(page).not_to have_content(@commitment.description)
    commitment = Commitment.find(@commitment.id)
    expect(commitment.description).not_to eq("")
    expect(commitment.description).to eq("test description and stuff")
  end

  scenario "should successfully edit virtue description", js:true do
    click_on "Virtues"
    click_on "Edit"
    fill_in "Description", with: "A new description"
    click_on "Save"
    expect(current_path).to eq(virtues_path)
    expect(page).to have_content("A new description")
    expect(page).not_to have_content("test description and stuff")
    expect(page).to have_content(@virtue.name)
  end
end
