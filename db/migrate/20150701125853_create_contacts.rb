class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :email
      t.boolean :newsletter

      t.timestamps null: false
    end
  end
end
