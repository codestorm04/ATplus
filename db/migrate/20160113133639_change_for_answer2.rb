class ChangeForAnswer2 < ActiveRecord::Migration
  def change
    change_column Answer,:toreply_id,:string
  end
end
