class AddCompetitorIdToScoreSheet < ActiveRecord::Migration
  def change
    add_column :score_sheets, :competitor_id, :integer
  end
end
