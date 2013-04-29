class RemoveScoreSheetIdFromJudge < ActiveRecord::Migration
  def up
    remove_column :judges, :score_sheet_id
  end

  def down
    add_column :judges, :score_sheet_id, :integer
  end
end
