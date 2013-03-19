class AddEventIdToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :event_id, :integer
  end
end
