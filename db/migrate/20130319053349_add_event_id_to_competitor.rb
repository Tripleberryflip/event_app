class AddEventIdToCompetitor < ActiveRecord::Migration
  def change
    add_column :competitors, :event_id, :integer
  end
end
