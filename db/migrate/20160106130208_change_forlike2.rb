class ChangeForlike2 < ActiveRecord::Migration
  def change
    add_column Like,:user_id,:integer
  end
end
