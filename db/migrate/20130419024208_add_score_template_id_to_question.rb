class AddScoreTemplateIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :score_template_id, :integer
  end
end
