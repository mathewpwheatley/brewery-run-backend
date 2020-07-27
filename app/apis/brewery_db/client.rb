# Setup brewery database with API key
brewery_db = BreweryDB::Client.new do |config|
    api_key = Rails.application.credentials[:brewery_db_api_key]
    config.api_key = api_key    
end
