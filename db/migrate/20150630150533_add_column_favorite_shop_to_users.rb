class AddColumnFavoriteShopToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_shop, :string
  end
end
