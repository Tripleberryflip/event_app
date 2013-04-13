class AddScoreTemplateIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :score_template_id, :integer
  end
end
