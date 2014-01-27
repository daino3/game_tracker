json.array!(@teams) do |team|
  json.extract! team, :id, :sport_id, :name, :wins, :losses
  json.url team_url(team, format: :json)
end
