class ChangeTypeColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :type, :string, null: false, default: "Artist"
  end
end
