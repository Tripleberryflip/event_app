class AddEmailToEventCoordinator < ActiveRecord::Migration
  def change
    add_column :event_coordinators, :email, :string
  end
end
