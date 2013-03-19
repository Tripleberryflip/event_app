class AddQuestionIdToScoreTemplate < ActiveRecord::Migration
  def change
    add_column :score_templates, :question_id, :integer
  end
end
