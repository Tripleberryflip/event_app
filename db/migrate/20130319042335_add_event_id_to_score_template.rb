class AddEventIdToScoreTemplate < ActiveRecord::Migration
  def change
    add_column :score_templates, :event_id, :integer
  end
end
