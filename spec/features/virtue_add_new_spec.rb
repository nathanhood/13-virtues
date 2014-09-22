feature "Add Virtue" do

  background do
    @user = FactoryGirl.create(:user)
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "foobar11"
    click_on "Submit"
    click_on "Virtues"
  end

  scenario "first virtue", js: true do
    expect(current_path).to eq(virtues_path)
    expect(page).to have_content('Add Virtue')
    expect(page).to have_content('Description')
  end

  scenario "visiting page after first virtue has already been added", js: true do
    @virtue = FactoryGirl.create(:virtue)
    FactoryGirl.create(:commitment, user: @user, virtue: @virtue)
    visit "/virtues"
    expect(current_path).to eq(virtues_path)
    expect(page).not_to have_content('Description')
  end

  scenario "should render virtues index", js:true do
    expect(page).to have_content("Sign Out")
    expect(current_path).to eq(virtues_path)
  end

  scenario "successfully adding a virtue", js: true do
    fill_in "Virtue", with: "test virtue 1"
    fill_in "Description", with: "some test description"
    click_on "Submit"
    expect(current_path).to eq(virtues_path)
    expect(page).to have_content("Add Virtue")
    expect(page).to have_css('li')
    expect(page).to have_content('Test Virtue 1')
    expect(page).to have_content('some test description')
    expect(page).to have_content('Success')
  end

  scenario "should successfully create a virtue from existing virtue", js: true do
    # pending("something else getting finished")
    @virtue = FactoryGirl.create(:virtue)
    FactoryGirl.create(:commitment, user: @user, virtue: @virtue)
    visit "/virtues"
    click_on "Add Virtue"
    # select(@virtue.name, :from => 'virtue[name]', :visible => false)
    # find("#virtue_commitments_description").trigger('focus')
    fill_in "Virtue", with: @virtue.name
    fill_in "Description", with: "second test description"
    click_on "Submit"
    expect(current_path).to eq(virtues_path)
    expect(page).to have_content("second test description")
  end

end
