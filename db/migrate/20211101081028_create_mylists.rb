class CreateMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :mylists do |t|
      t.string :name
      t.integer :user_id
      t.integer :lifehack_id

      t.timestamps
    end
  end
end
