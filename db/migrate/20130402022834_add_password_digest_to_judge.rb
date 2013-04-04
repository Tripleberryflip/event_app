class AddPasswordDigestToJudge < ActiveRecord::Migration
  def change
    add_column :judges, :password_digest, :string
  end
end
