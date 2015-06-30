class AddLogeRefToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :loge, index: true
  end
end
