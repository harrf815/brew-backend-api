require 'rest-client'
require 'json'
require 'pry'
require 'faker'

# User.destroy_all
# FeedBack.destroy_all
# Brewery.destroy_all


10.times do 
    name = Faker::Movies::PrincessBride.character
    User.create(username: name.split(' ').join(','), password: "1234")
end

def get_breweries
    #gets info from api 
    file = open('./newbreweries.json')
    json = file.read
    parsed = JSON.parse(json)
    # binding.pry
    
    random = User.all.sample
    comments = ["Meh.", "Yeedawgy.", "They got dollar shots, so...", "Beer was beer I guess", "Would I go back? Maybe"]
    
    
    parsed.each do |brew|
       newbrew = Brewery.create(
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
    
        FeedBack.create(comments: comments.sample, rating: rand(1..5), user_id: User.all.sample[:id],brewery_id: newbrew[:id])
    end
end

get_breweries
