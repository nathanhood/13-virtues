require 'rails_helper'

RSpec.describe DailyReport, :type => :model do
  it { should validate_presence_of :user }

  before do
    @user = FactoryGirl.create(:user)
  end

  describe "format_entry method" do
    it "should make entry default value" do
      daily_report = DailyReport.create(entry: '', user: @user)
      expect(daily_report.entry).to eq("No entry added for this day.")
      expect(DailyReport.all.count).to eq(1)
    end

    it "should successfully create a report without entry text from user" do
      expect { DailyReport.create(entry: '', user: @user) }.to change{ DailyReport.all.count }.by(1)
    end

    it "should successfully create a report" do
      daily_report = DailyReport.create(entry: 'this is a test entry', user: @user)
      daily_report = DailyReport.find(daily_report.id)
      expect(daily_report.entry).to eq("this is a test entry")
      expect(DailyReport.all.count).to eq(1)
    end

    it "should not create a report - no user" do
      daily_report = DailyReport.create(entry: 'this is a test entry')
      expect(DailyReport.all.count).to eq(0)
    end
  end
end
