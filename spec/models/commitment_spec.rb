require 'rails_helper'

RSpec.describe Commitment, :type => :model do

  before do
    @user = FactoryGirl.create(:user)
    @virtue = FactoryGirl.create(:virtue)
  end

  it { should validate_presence_of :description }
  it { should validate_presence_of :user }
  it { should validate_presence_of :virtue }
  it { should belong_to :user }
  it { should belong_to :virtue }

  it "should successfully create commitment" do
    commitment = Commitment.create(description: "test description", user: @user, virtue: @virtue)
    expect(commitment.user_id).to eq(@user.id)
    expect(commitment.virtue_id).to eq(@virtue.id)
    expect(commitment.description).to eq("test description")
    expect(Commitment.all.count).to eq(1)
  end

  it "should not create a description" do
    commitment = Commitment.create(description: "", user: @user, virtue: @virtue)
    expect(Commitment.all.count).to eq(0)
  end
end
