class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :number_of_children, :integer
    add_column :users, :neighbour_since, :date
    add_column :users, :occupation, :text
    add_column :users, :favorite_shops, :string
    add_column :users, :personal_description, :text
  end
end
