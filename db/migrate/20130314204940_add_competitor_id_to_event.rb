class AddCompetitorIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :competitor_id, :integer
  end
end
