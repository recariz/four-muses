class CreateContestTags < ActiveRecord::Migration[6.0]
  def change
    create_table :contest_tags do |t|
      t.references :category, null: false, foreign_key: true
      t.references :contest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
