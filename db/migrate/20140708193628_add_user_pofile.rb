class AddUserPofile < ActiveRecord::Migration
  def change
      create_table :user_profiles do |t|
      t.string :motto, default: ""
      t.text :bio, default: ""
      t.text :interests, default: ""
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
