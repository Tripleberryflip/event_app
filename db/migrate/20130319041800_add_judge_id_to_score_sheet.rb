class AddJudgeIdToScoreSheet < ActiveRecord::Migration
  def change
    add_column :score_sheets, :judge_id, :integer
  end
end
