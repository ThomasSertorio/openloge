class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :booking, index: true, foreign_key: true
      t.text :description
      t.boolean :recommendation

      t.timestamps null: false
    end
  end
end
