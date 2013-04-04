class AddPasswordDigestToEventCoordinator < ActiveRecord::Migration
  def change
    add_column :event_coordinators, :password_digest, :string
  end
end
