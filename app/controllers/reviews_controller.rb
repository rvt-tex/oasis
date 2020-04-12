class ReviewsController < ApplicationController
    before_action :find_appointment

    def new 
        @review = Review.new 
    end

    def create 
        @review = Review.new(review_params)
        @review.appointment_id = appointment.id 
        @review.client_id = current_client.id 
        if @review.save 
            redirect_to appointment_path(@appointment)
        else 
            render 'new'
        end 

    end 


    private 
    
    def review_params
        params.require(:review).permit(params[:rating, :comment])
    end 
    def find_appointment 
        @appointment = Appointment.find_by(params[:appointment_id])
    end 

end
