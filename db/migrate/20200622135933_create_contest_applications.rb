class CreateContestApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :contest_applications do |t|
      t.string :status, :integer, null: false, default: 0
      t.text :motivation
      t.references :user, null: false, foreign_key: true
      t.references :contest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
