class AddEmailToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :email, :string
  end
end
