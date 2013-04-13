class AddRememberJudgeToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :remember_judge, :string
    add_index  :judges, :remember_judge
  end
end
