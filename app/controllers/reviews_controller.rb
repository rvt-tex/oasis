class ReviewsController < ApplicationController

    def index
        @review = Review.all
    end 

    def new
        @review = Review.new  
    end 

    def create 
        @review = Review.new(review_params)
        if @review.save 
            redirect_to @review
        else 
            binding.pry
            render :new 
        end 
    end 

    def show 
        @review = Review.find_by(params[:id])
    end 

    private 

    def review_params
        params.require('review').permit(:content, :client_id)
    end 
end
