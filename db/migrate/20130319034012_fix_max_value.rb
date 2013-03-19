class FixMaxValue < ActiveRecord::Migration
  def up
    rename_column :questions, :MaxValue, :max_value
  end

  def down
  end
end
