class CreateLoges < ActiveRecord::Migration
  def change
    create_table :loges do |t|
      t.string :name
      t.text :description
      t.date :created_on

      t.timestamps null: false
    end
  end
end
