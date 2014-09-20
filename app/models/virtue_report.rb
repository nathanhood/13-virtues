class VirtueReport < ActiveRecord::Base
  belongs_to :daily_report
  belongs_to :virtue

  validates_presence_of :virtue, :daily_report, :rating
end
