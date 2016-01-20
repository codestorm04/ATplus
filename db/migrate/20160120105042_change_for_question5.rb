class ChangeForQuestion5 < ActiveRecord::Migration
  def change
    remove_column(Question,:state)
    add_column(Question,:state,:integer)
  end
end
