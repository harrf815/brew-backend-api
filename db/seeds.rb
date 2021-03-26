require 'rest-client'
require 'json'
require 'pry'

Brewery.destroy_all
User.destroy_all
FeedBack.destroy_all

def get_breweries
 #gets info from api 
file = open('./breweries.json')
json = file.read
parsed = JSON.parse(json)
# binding.pry

parsed.each do |brew|

    if brew["latitude"] == nil|| brew["longitude"] == nil
        brew["latitude"] = 1.1
        brew["longitude"] = 1.1
    end
        Brewery.create(
            name: brew["name"],
            phone: brew["phone"],
            brewery_type: brew["brewery_type"],
            website_url: brew["website_url"],
            street: brew["street"],
            state: brew["state"],
            city: brew["city"],
            zip: brew["postal_code"],
            lat: brew["latitude"],
            long: brew["longitude"]
        )
        
    end
end

get_breweries
