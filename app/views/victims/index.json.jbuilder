json.array!(@victims) do |victim|
  json.extract! victim, :id, :date, :name, :reason, :ip
  json.url victim_url(victim, format: :json)
end
