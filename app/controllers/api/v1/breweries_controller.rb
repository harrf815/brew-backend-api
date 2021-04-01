class Api::V1::BreweriesController < ApplicationController
    skip_before_action :authorized


    #all breweries endpoint has a long load time
    def index
        breweries = Brewery.all 
        render json: breweries
    end

    #used for all breweries by state
    def state  
        breweries = Brewery.all.where(state: params[:state])
        render json: breweries
    end

    def washington  
        breweries = Brewery.all.where(state: "Washington")
        render json: breweries
    end

    def show  
        brewery = Brewery.find(params[:id])
        render json: brewery
    end

    def getstates
        states_unfiltered = Brewery.all.map{|brew| brew.state }.uniq
        states = states_unfiltered.filter{|state| state.length > 1 }
        render json: states
    end

    private
    # will need to add strong params if going further with CRUD for breweries
end


