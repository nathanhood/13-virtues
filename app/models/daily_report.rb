class DailyReport < ActiveRecord::Base
  validates_presence_of :user
  before_save { self.entry = format_entry(entry) }

  belongs_to :user
  has_many :virtue_reports
  has_many :virtues, through: :virtue_reports

  default_scope -> { order("created_at DESC") }

  accepts_nested_attributes_for :virtue_reports

  private
    def format_entry(entry)
      entry = entry.strip
      if entry.length == 0
        return entry = "No entry added for this day."
      else
        return entry
      end
    end
end
