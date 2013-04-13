class AddMaxValueToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :MaxValue, :integer
  end
end
