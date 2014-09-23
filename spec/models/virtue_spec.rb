require 'rails_helper'

RSpec.describe Virtue, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should ensure_length_of(:name).is_at_most(20) }
  it { should have_many :virtue_reports }
  it { should have_many :daily_reports }

  describe "format_name method" do
    it "should produce a camel-cased virtue name" do
      virtue = Virtue.create(name: "test  virtue")
      expect(virtue.name).to eq("Test Virtue")
    end

    it "should remove special characters" do
      virtue = Virtue.create(name: "test!- virtue,./")
      expect(virtue.name).to eq("Test Virtue")
    end

    context "single word name" do
      it "should produce a camel-cased name" do
        virtue = Virtue.create(name: "virtue")
        expect(virtue.name).to eq("Virtue")
      end
    end

    context "blank" do
      it "should not throw an error" do
        virtue = Virtue.create(name: " ")
        expect(Virtue.all.count).to eq(0)
      end
    end
  end

  describe "#calculate_monthly_virtue_average" do
    before do
      @user = FactoryGirl.create(:user)
      @virtue1 = FactoryGirl.create(:virtue)
      @commitment1 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue1)
      @daily_report = FactoryGirl.create(:daily_report, user: @user)
      @daily_report2 = FactoryGirl.create(:daily_report, user: @user)
      @daily_report3 = FactoryGirl.create(:daily_report, user: @user, created_at: DateTime.new(2014, 1, 8))
      @virtue_report1 = FactoryGirl.create(:virtue_report, rating: 1, daily_report: @daily_report, virtue: @virtue1)
      @virtue_report2 = FactoryGirl.create(:virtue_report, rating: 5, daily_report: @daily_report2, virtue: @virtue1)
      @virtue_report3 = FactoryGirl.create(:virtue_report, rating: 5, daily_report: @daily_report3, virtue: @virtue1, created_at: DateTime.new(2014, 1, 8))
    end

    it "should return object with virtue average rating over 30 days" do
      avg = @virtue1.calculate_monthly_virtue_average(@user)
      expect(avg).to eq({ name: @virtue1.name, data: [3] })
    end
  end

  describe "#calculate_total_virtue_average" do
    before do
      @user = FactoryGirl.create(:user)
      @virtue1 = FactoryGirl.create(:virtue)
      @commitment1 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue1)
      @daily_report = FactoryGirl.create(:daily_report, user: @user)
      @daily_report2 = FactoryGirl.create(:daily_report, user: @user)
      @daily_report3 = FactoryGirl.create(:daily_report, user: @user)
      @virtue_report1 = FactoryGirl.create(:virtue_report, rating: 1, daily_report: @daily_report, virtue: @virtue1)
      @virtue_report2 = FactoryGirl.create(:virtue_report, rating: 5, daily_report: @daily_report2, virtue: @virtue1)
      @virtue_report3 = FactoryGirl.create(:virtue_report, rating: 5, daily_report: @daily_report3, virtue: @virtue1, created_at: 31.days.ago)
    end

    it "should return object with total average rating - including virtue_report3" do
      avg = @virtue1.calculate_total_virtue_average(@user)
      expect(avg).to eq({ name: @virtue1.name, average: 3.67 })
    end
  end

  describe ".calculate_virtue_percentage" do
    before do
      @user = FactoryGirl.create(:user)
      @virtue1 = FactoryGirl.create(:virtue)
      @virtue2 = FactoryGirl.create(:virtue)
      @commitment1 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue1)
      @commitment1 = FactoryGirl.create(:commitment, user: @user, virtue: @virtue2)
      @daily_report = FactoryGirl.create(:daily_report, user: @user)
      @daily_report2 = FactoryGirl.create(:daily_report, user: @user)
      @daily_report3 = FactoryGirl.create(:daily_report, user: @user)
      @daily_report4 = FactoryGirl.create(:daily_report, user: @user)
      @virtue_report1 = FactoryGirl.create(:virtue_report, rating: 2, daily_report: @daily_report, virtue: @virtue1)
      @virtue_report2 = FactoryGirl.create(:virtue_report, rating: 5, daily_report: @daily_report2, virtue: @virtue1)
      @virtue_report3 = FactoryGirl.create(:virtue_report, rating: 2, daily_report: @daily_report3, virtue: @virtue2)
      @virtue_report4 = FactoryGirl.create(:virtue_report, rating: 1, daily_report: @daily_report4, virtue: @virtue2)
    end

    it "should return percentage of virtues in proper format" do
      avg = @virtue1.calculate_total_virtue_average(@user)
      avg2 = @virtue2.calculate_total_virtue_average(@user)
      averages = [avg, avg2]
      percentage = Virtue.calculate_virtue_percentage(averages)
      expect(percentage).to eq([[@virtue1.name, 70.0], [@virtue2.name, 30.0]])
    end
  end

end
