class ChangeForAnswers < ActiveRecord::Migration
  def change
    rename_column(Answer,:questionid,:question_id)
  end
end
