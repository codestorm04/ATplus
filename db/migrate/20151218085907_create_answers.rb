class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :questionid
      t.integer :level
      t.string :title
      t.string :content
      t.string :answeruser
      t.string :filepath
      t.string :liker
      t.string :obligate1
      t.string :obligate2
      t.string :obligate3

      t.timestamps null: false
    end
  end
end
