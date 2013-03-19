class AddEventIdToEventCoordinator < ActiveRecord::Migration
  def change
    add_column :event_coordinators, :event_id, :integer
  end
end
