#! Seeding Instructions:
#? Before seeding the database:
    # Run bundle install in the terminal to ensure all gem dependencies are met. 
    # Postgresql must be installed and running.

#? seeding the database:
    # If this is your first time seeding: 
        # rails db:create
        # rails db:migrate
        # rails db:seed
    # Else if existing database:
        # rails db:reset #!this will drop, create, run migrations and seed#!

require 'rest-client'
require 'json'
require 'pry'
require 'faker'


def seed_characters
    10.times do 
        name = Faker::Movies::PrincessBride.character
        User.create(username: name.split(' ').join(','), password: "1234")
    end
end

def seed_breweries
    file = open('./db/seeding/newbreweries.json')
    json = file.read
    parsed = JSON.parse(json)
    
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

seed_characters
seed_breweries

