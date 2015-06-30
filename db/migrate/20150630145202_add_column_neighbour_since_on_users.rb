class AddColumnNeighbourSinceOnUsers < ActiveRecord::Migration
  def change
    add_column :users, :neighbour_since, :integer
  end
end
