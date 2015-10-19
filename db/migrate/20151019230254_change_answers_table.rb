class ChangeAnswersTable < ActiveRecord::Migration
  def change
    rename_column :answers, :question_id, :post_id
  end
end
