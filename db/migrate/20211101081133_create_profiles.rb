class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :lifehack_id
      t.integer :mylist_id
      t.integer :like_id

      t.timestamps
    end
  end
end
