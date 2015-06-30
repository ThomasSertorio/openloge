class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :booking, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :posted_at
      t.text :content

      t.timestamps null: false
    end
  end
end
