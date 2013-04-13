class CreateQuestionsScoreTemplates < ActiveRecord::Migration
  def change
    create_table :questions_score_templates do |t|
      t.integer :question_id
      t.integer :score_template_id

      t.timestamps
    end
  end
end
