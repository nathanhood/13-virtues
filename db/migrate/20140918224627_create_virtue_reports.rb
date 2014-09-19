class CreateVirtueReports < ActiveRecord::Migration
  def change
    create_table :virtue_reports do |t|
      t.integer :rating
      t.references :daily_report, index: true
      t.references :virtue, index: true

      t.timestamps
    end
  end
end
