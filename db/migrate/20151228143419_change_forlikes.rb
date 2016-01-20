class ChangeForlikes < ActiveRecord::Migration
  def change
    add_column Like,:answer_id,:integer
  end
end
