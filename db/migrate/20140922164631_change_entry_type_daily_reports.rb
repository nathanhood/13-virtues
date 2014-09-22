class ChangeEntryTypeDailyReports < ActiveRecord::Migration
  def change
    change_column :daily_reports, :entry, :text
  end
end
