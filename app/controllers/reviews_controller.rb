class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end 

    def show 
        @review = Review.find_by(params[:id])
    end 

    def new
        @review = Review.new  
    end 

    def create 
        @review = current_client.reviews.build(review_params)
        if @review.save 
            redirect_to @review
        else 
            render :new 
        end 
    end 

    def edit
        if params[:client_id]
          client = Client.find_by(id:params[:client_id])
          if client
            @review = client.reviews.find_by(id:params[:id])
            redirect_to client_reviews_path(client) if !@review
          else
            redirect_to clients_path, alert: ""
          end
        else
          @review = Review.find(params[:id])
        end
    end

    def update 
        @review = Review.find(params[:id])
        @review.update(review_params)
        if @review.save
          redirect_to @review
        else
          render :edit
        end
    end 

    def destroy 
      @review = Review.find_by_id(params[:id])
      if is_logged_in? 
        @review = current_client.reviews.find_by_id(params[:id])
        if @review
          @review.destroy
          flash[:message] = "Your review was deleted."
          redirect_to reviews_path(current_client)  
        else
          flash[:message] = "Unable to delete this review since it doesn't belong to you."
          redirect_to "/"
        end
      else
        flash[:message] = "You need to be logged in first to access this page."
        redirect_to "/login"
      end
    end

    private 

    def review_params
        params.require('review').permit(:content, :client_id)
    end 
end
