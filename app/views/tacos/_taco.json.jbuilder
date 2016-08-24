json.extract! taco, :id, :notes, :meat_id, :created_at, :updated_at
json.url taco_url(taco, format: :json)