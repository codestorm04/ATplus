class ChangeForQuestion2 < ActiveRecord::Migration
  def change
    add_column Question,:state,:string
  end
end
