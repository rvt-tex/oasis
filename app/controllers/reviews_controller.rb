class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :edit, :update]
    before_action :redirect_if_not_review_owner, only: [:edit, :update]


    def index 
        if params[:appointment_id] && @appointment = Appointment.find_by_id(params[:appointment_id])
            @reviews = @appointment.reviews
        else
           @error = "That review doesn't exist" if params[:appointment_id]
           @reviews = Review.all
        end
    end 

    def new 
        #if it's nested and why find the appointment
       if params[:appointment_id] && @appointment = Appointment.find_by_id(params[:appointment_id])
         @review = @appointment.reviews.build
       else
         @error = "That appointment doesn't exist" if params[:appointment_id]
         @review = Review.new
       end	
    end 
   
   def create
        @review = current_client.reviews.build(review_params)
       if @review.save
         redirect_to reviews_path
       else
         render :new
       end
   end 

   def show 
   end 
   
   def edit
   end		

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end
   
    private

    def review_params
        params.require(:review).permit(:content, :rating, :appointment_id)
    end

    def set_review
        @review = Review.find_by(id: params[:id])
        if !@review
            flash[:message] = "Review was not found"
            redirect_to reviews_path
        end
    end
			

    def redirect_if_not_review_owner
        redirect_to reviews_path if @review.client != current_client
    end
end
