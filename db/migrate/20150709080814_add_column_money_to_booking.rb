class AddColumnMoneyToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :sku, :string
    add_monetize :bookings, :price, currency: { present: false }
  end
end
