class Api::V1::UsersController < ApplicationController
    def index
        breweries = Brewery.all 
        render json: breweries
    end

    def state  
        breweries = Brewery.all.
    end
end
