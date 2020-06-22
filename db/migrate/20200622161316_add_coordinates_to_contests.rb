class AddCoordinatesToContests < ActiveRecord::Migration[6.0]
  def change
    add_column :contests, :latitude, :float
    add_column :contests, :longitude, :float
  end
end
