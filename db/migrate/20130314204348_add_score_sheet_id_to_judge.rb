class AddScoreSheetIdToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :score_sheet_id, :integer
  end
end
