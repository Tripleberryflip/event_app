class CreateScoresheets < ActiveRecord::Migration
  def change
    create_table :score_sheets do |t|
      t.string :name

      t.timestamps
    end
  end
end
