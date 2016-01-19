class ChangeForQuestion4 < ActiveRecord::Migration
  def change
    remove_column(Question,:questionuser)
    add_column(Question,:user_id,:integer)
  end
end
