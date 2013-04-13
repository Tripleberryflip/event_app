class AddRememberCoordinatorToEventCoordinator < ActiveRecord::Migration
  def change
    add_column :event_coordinators, :remember_coordinator, :string
    add_index  :event_coordinators, :remember_coordinator
  end
end
