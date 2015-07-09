class AddColumnMoneyToService < ActiveRecord::Migration
  def change
    add_column :services, :sku, :string
    add_monetize :services, :price, currency: { present: false }
  end
end
