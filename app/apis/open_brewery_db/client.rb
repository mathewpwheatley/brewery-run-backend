# Required gems for Dog API request in db/seed.rb 
require 'net/http'
require 'open-uri'
require 'json'

def seattle_breweries
    uri = URI.parse("https://api.openbrewerydb.org/breweries?by_city=seattle")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
end