class ClientsController < ApplicationController

    def new 
        @client = Client.new
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
        require_login
        @client = Client.find_by_id(params[:id])
    end 

    def client_params
        params.require('client').permit(:first_name, :last_name, :password,:phone,:email)
    end
end
