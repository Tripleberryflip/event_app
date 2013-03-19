class CreateEventsJudges < ActiveRecord::Migration
  def change
    create_table :events_judges do |t|
      t.integer :event_id
      t.integer :judge_id

      t.timestamps
    end
  end
end
