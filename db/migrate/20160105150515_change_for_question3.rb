class ChangeForQuestion3 < ActiveRecord::Migration
  def change
    change_column(Question,:state,:integer)
  end
end
