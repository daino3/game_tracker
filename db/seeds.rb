# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NFL = Sport.find_or_create_by!(name: "NFL")
NBA = Sport.find_or_create_by!(name: "NBA")
MLB = Sport.find_or_create_by!(name: "MLB")

client = ESPN::Client.new(api_key: ENV["ESPN_KEY"])

mlb_teams = client.teams(:mlb)
nfl_teams = client.teams(:nfl)
nba_teams = client.teams(:nba)

teams = {"MLB" => mlb_teams, "NFL" => nfl_teams, "NBA" => nba_teams}

teams.each do |league, teams|
  sport_id = Sport.find_by_name(league).id
  teams.each do |team|
    Team.find_or_create_by!(espn_id: team.uid) do |record|
      record.name = team.name
      record.sport_id = sport_id
      record.espn_id = team.uid
      record.location = team.location
      record.abbreviation = team.abbreviation
    end
  end
end 