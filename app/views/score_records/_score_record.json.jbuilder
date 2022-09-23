json.extract! score_record, :id, :goals, :player_id, :team_id, :match_id, :created_at, :updated_at
json.url score_record_url(score_record, format: :json)
