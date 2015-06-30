class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.string :status
      t.string :pricing_nature
      t.datetime :starts_at
      t.integer :duration
      t.text :description

      t.timestamps null: false
    end
  end
end
