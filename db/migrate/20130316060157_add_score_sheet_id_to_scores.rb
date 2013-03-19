class AddScoreSheetIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :score_sheet_id, :integer
  end
end
