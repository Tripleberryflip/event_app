class AddScoreSheetIdToCompetitor < ActiveRecord::Migration
  def change
    add_column :competitors, :score_sheet_id, :integer
  end
end
