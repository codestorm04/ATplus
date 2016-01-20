class ChangeForAnswer6 < ActiveRecord::Migration
  def change
    remove_column(Answer,:answeruser)
    remove_column(Answer,:toreply_id)
    add_column(Answer,:toreply_id,:integer)
  end
end
