class CreatePostTags < ActiveRecord::Migration[6.0]
  def change
    create_table :post_tags do |t|
      t.references :category, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
