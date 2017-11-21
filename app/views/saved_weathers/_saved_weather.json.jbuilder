json.extract! saved_weather, :id, :yahoo_title, :created_at, :updated_at
json.url saved_weather_url(saved_weather, format: :json)
