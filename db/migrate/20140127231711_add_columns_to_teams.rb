class AddColumnsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :location, :string
    add_column :teams, :abbreviation, :string
    add_column :teams, :espn_id, :string
  end
end
