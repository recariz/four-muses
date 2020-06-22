class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
