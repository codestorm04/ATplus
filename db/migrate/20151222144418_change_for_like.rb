class ChangeForLike < ActiveRecord::Migration
  def change
    add_column(Like,:question_id,:integer)
    #change_column(Like,:user_id,:integer)
    remove_column(Like,:likeid)
  end
end
