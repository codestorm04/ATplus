class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :path
      t.string :keyword
      t.string :publication
      t.string :field
      t.string :author
      t.string :obligate1
      t.string :obligate2
      t.string :obligate3

      t.timestamps null: false
    end
  end
end
