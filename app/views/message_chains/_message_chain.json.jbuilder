json.extract! message_chain, :id, :name, :created_at, :updated_at
json.url message_chain_url(message_chain, format: :json)
