class AddQuestionIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :question_id, :integer
  end
end
