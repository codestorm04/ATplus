class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :level
      t.integer :fatherid

      t.timestamps null: false
    end
  end
end
