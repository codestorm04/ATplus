class ChangeForAnswer3 < ActiveRecord::Migration
  def change
    add_column(Answer,:user_id,:integer)
  end
end
