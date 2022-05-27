json.extract! game, :id, :whiteteamcolor, :blackteamcolor, :boardposition, :winner, :movehistory, :turn, :created_at, :updated_at
json.url game_url(game, format: :json)
