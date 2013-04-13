class CreateScoreTemplates < ActiveRecord::Migration
  def change
    create_table :score_templates do |t|

      t.timestamps
    end
  end
end
