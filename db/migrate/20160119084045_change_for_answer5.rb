class ChangeForAnswer5 < ActiveRecord::Migration
  def change
    remove_column(Answer,:answeruser)
    change_column(Answer,:toreply_id,:integer)
  end
end
