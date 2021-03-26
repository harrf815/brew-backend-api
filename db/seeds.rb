require 'rest-client'
require 'json'
require 'pry'


def get_breweries
 #gets info from api 
file = open('./breweries.json')
json = file.read
parsed = JSON.parse(json)

parsed.each do |brew|
        Brewery.create(
        name: brew[:name],
        phone: brew[:phone],
        brewery_type: brew[:brewery_type],
        website_url: brew[:website_url],
        street: [:street],
        state: [:state],
        city: [:city],
        zip: [:postal_code],
        lat: [:latitude],
        long: [:longitude])
    end
end

get_breweries
