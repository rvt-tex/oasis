class ClientsController < ApplicationController

    def new 
    end 

    def create 
        @client = Client.new(client_params)
        if @client.save 
            session[:client_id] = @client.id
            redirect_to @client
        else 
            render :new 
        end 
    end 

    def show 
    end 

    def client_params
        params.require('client').permit(:first_name, :last_name, :password,:phone,:email)
    end
end
