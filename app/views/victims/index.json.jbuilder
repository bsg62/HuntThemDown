json.array!(@victims) do |victim|
  json.extract! victim, :id, :name, :reason, :ip_address
  json.url victim_url(victim, format: :json)
end
