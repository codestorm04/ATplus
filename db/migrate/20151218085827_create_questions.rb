class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.string :questionuser
      t.integer :articleid
      t.string :field
      t.string :filepath
      t.string :liker
      t.string :obligate1
      t.string :obligate2
      t.string :obligate3

      t.timestamps null: false
    end
  end
end
