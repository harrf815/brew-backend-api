class Api::V1::FeedBacksController < ApplicationController

    skip_before_action :authorized

    def index
        feedbacks = FeedBack.all 
        render json: feedbacks
    end

    def create 
        feedback = FeedBack.create(feedback_params)
        render json: feedback
    end

    private

    def feedback_params
        params.permit(:comments, :rating, :user_id, :brewery_id)
    end
end
