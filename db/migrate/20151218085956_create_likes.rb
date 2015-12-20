class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :liketype
      t.integer :likeid
      t.string :useremail

      t.timestamps null: false
    end
  end
end
