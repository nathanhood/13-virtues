require 'rails_helper'

RSpec.describe VirtueReport, :type => :model do
  it { should validate_presence_of :virtue }
  it { should validate_presence_of :daily_report }
  it { should validate_presence_of :rating }
  it { should belong_to :virtue }
  it { should belong_to :daily_report }

end
