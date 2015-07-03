class AddColumnNewMessageToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :new_message, :boolean
  end
end
