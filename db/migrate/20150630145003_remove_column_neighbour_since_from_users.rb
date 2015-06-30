class RemoveColumnNeighbourSinceFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :neighbour_since, :date
  end
end
