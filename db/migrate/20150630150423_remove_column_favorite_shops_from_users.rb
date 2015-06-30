class RemoveColumnFavoriteShopsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_shops, :string
  end
end
