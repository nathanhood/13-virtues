require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_uniqueness_of :email }
  it { should have_many :commitments }
  it { should have_many :virtues }
  it { should have_many :daily_reports }

  context "User wants to reset password" do
    it "sends an email to reset password" do
      expect { @user.send_reset_password_instructions }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
