class ChangeForAnswer1 < ActiveRecord::Migration
  def change
    add_column Answer,:toreply_id,:integer
  end
end
