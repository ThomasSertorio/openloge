class AddPictureFacebookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picture_facebook, :string
  end
end
