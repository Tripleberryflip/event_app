class AddEventIdToScoreSheet < ActiveRecord::Migration
  def change
    add_column :score_sheets, :event_id, :integer
  end
end
