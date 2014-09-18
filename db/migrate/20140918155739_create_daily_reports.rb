class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.string :entry
      t.references :user, index: true

      t.timestamps
    end
  end
end
