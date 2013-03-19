class CreateEventCoordinators < ActiveRecord::Migration
  def change
    create_table :event_coordinators do |t|
      t.string :name

      t.timestamps
    end
  end
end
