require 'rails_helper'

RSpec.describe Virtue, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should ensure_length_of(:name).is_at_most(20) }

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
end
