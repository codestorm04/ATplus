class ChangeForQuestion < ActiveRecord::Migration
  def change
    rename_column(Question,:articleid,:article_id)
  end
end
