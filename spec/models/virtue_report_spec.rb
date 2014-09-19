require 'rails_helper'

RSpec.describe VirtueReport, :type => :model do
  it { should validate_presence_of :virtue }
  it { should validate_presence_of :daily_report }

end
