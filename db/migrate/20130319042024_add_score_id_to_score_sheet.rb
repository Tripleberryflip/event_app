class AddScoreIdToScoreSheet < ActiveRecord::Migration
  def change
    add_column :score_sheets, :score_id, :integer
  end
end
