class RemoveNameFromScoresheet < ActiveRecord::Migration
  def up
    remove_column :score_sheets, :name
      end

  def down
    add_column :score_sheets, :name, :string
  end
end
