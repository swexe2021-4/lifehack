class CreateMylistNames < ActiveRecord::Migration[5.2]
  def change
    create_table :mylist_names do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
