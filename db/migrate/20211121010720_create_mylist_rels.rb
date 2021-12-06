class CreateMylistRels < ActiveRecord::Migration[5.2]
  def change
    create_table :mylist_rels do |t|
      t.integer :mylist_name_id
      t.integer :lifehack_id

      t.timestamps
    end
  end
end
