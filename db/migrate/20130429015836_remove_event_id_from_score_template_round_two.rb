class RemoveEventIdFromScoreTemplateRoundTwo < ActiveRecord::Migration
  def up
    remove_column :score_templates, :event_id
      end

  def down
    add_column :score_templates, :event_id, :integer
  end
end
