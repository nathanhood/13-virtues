class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.string :description
      t.references :user, index: true
      t.references :virtue, index: true

      t.timestamps
    end
  end
end
