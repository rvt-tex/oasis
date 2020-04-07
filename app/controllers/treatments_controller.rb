class TreatmentsController < ApplicationController

    def index 
    end 

    def new 
        @treatment = Treatment.new  
    end 

    def create
        #binding.pry
        @treatment = Treatment.new(treatment_params)
        if @treatment.save 
            redirect_to @treatment
        else 
            render :new 
        end 
    end 

    def show
        @treatment = Treatment.all 
    end 

    # def destroy
    #     if @treatment.destroy
    #       flash[:success] = 'The content was deleted successfully.'
    #       redirect_to '/'
    #     else
    #       flash[:error] = "The content couldn't be deleted."
    #       redirect_to clients_path
    #     end
    # end







    private 

    def treatment_params
        params.require('treatment').permit(:title, :price, :duration, :description)
    end
end
