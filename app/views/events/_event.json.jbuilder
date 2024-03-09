json.extract! event, :id, :name, :start_at, :end_at, :creator_id, :location_id, :created_at, :updated_at
json.url event_url(event, format: :json)
