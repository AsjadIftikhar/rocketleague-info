json.extract! player, :id, :name, :age, :country, :team_id, :created_at, :updated_at
json.url player_url(player, format: :json)
