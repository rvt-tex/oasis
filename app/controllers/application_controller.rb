class ApplicationController < ActionController::Base

    before_action :current_client, except:[:index]
    



    protect_from_forgery

    helper_method :current_client, :is_logged_in?, :client_name, :redirect_if_not_logged_in, :login_required, :client_allowed
    
    def current_client
       @current_client ||= Client.find_by_id(session[:client_id]) if session[:client_id]
    end

    def session_already_set
        redirect_to appointments_path if is_logged_in?
    end

    def is_logged_in?
        !!session[:client_id]
    end

    def is_logged_in?
        !!current_client
    end

    def login_required
        unless is_logged_in?
            flash[:error] = "You must be logged inorder to make an appointment"
            redirect_to login_path
        end
    end
   
    def redirect_if_not_logged_in
        redirect_to '/' if !is_logged_in? 
    end 

    # def client_allowed
    #     @current_client && (current_client.id == @appointment.client_id)
    # end
    # def owner?(appointment)
    #     Appointment.client == current_client
    # end

    def client_name
        current_client.fitst_name
    end
end
