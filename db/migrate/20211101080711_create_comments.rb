class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :lifehack_id
      t.string :comment
      t.datetime :time

      t.timestamps
    end
  end
end
