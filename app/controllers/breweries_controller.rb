class BreweriesController < ApplicationController
    def index
        breweries = Brewery.all 
        render json: breweries
    end

    def show
        state = Brewery.where(state: "Washington")
        render json: state
    end
end
