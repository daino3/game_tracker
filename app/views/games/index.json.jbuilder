json.array!(@games) do |game|
  json.extract! game, :id, :team1_id, :team2_id, :location, :team1_score, :team2_score, :line
  json.url game_url(game, format: :json)
end
