class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :user, index: true, foreign_key: true
      t.string :category
      t.string :title
      t.text :description
      t.string :pricing_nature

      t.timestamps null: false
    end
  end
end
