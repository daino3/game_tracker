class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :sport_id
      t.string :name
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
