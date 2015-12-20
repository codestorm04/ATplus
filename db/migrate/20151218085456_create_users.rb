class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :admin
      t.integer :sex
      t.string :institute
      t.string :phonenumber
      t.string :field
      t.string :obligate1
      t.string :obligate2
      t.string :obligate3

      t.timestamps null: false
    end
  end
end
