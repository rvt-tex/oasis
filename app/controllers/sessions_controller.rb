class SessionsController < ApplicationController

    def home
    end 

    def new 
    end 

    def create 
        @client = Client.find_by(email:params[:client][:email])
        if @client && @client.authenticate(params[:client][:password])
            session[:client_id] = @client.id
            redirect_to  @client
        else 
            flash[:message] = "incorrect login info, please try again"
            redirect_to "/login"
        end 
    end 

    def destroy 
        session.clear
        redirect_to root_path
    end 
end
