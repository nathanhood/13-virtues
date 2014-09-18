class DailyReport < ActiveRecord::Base
  before_save { self.entry = format_entry(entry) }

  belongs_to :user

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
