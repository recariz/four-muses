class AddCityToContests < ActiveRecord::Migration[6.0]
  def change
    add_column :contests, :city, :string
  end
end
