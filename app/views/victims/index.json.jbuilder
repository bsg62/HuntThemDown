json.array!(@victims) do |victim|
  json.extract! victim, :id, :name
  json.url victim_url(victim, format: :json)
end
