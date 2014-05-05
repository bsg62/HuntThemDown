json.array!(@offenses) do |offense|
  json.extract! offense, :id, :name, :reason, :ip_address
  json.url victim_url(offense, format: :json)
end
