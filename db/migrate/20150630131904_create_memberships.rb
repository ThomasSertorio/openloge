class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :loge, index: true, foreign_key: true
      t.date :member_since

      t.timestamps null: false
    end
  end
end
