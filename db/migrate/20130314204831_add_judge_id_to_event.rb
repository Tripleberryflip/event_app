class AddJudgeIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :judge_id, :integer
  end
end
