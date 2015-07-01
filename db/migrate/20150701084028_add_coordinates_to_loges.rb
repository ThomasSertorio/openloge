class AddCoordinatesToLoges < ActiveRecord::Migration
  def change
    add_column :loges, :latitude, :float
    add_column :loges, :longitude, :float
  end
end
