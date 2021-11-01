class CreateLifehacks < ActiveRecord::Migration[5.2]
  def change
    create_table :lifehacks do |t|
      t.integer :user_id
      t.string :title
      t.string :exp
      t.binary :file
      t.datetime :time

      t.timestamps
    end
  end
end
