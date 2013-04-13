class AddEventCoordinatorIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_coordinator_id, :integer
  end
end
