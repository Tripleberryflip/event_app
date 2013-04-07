class RemoveScoreIdFromScoreSheet < ActiveRecord::Migration
  def up
    remove_column :score_sheets, :score_id
      end

  def down
    add_column :score_sheets, :score_id, :integer
  end
end
