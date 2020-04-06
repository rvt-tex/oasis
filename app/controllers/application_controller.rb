class ApplicationController < ActionController::Base

    helper_method :is_logged_in?
    helper_method :logged_in?
    helper_method :current_client 
 
   # def current_client
   #     @current_client ||= Client.find_by_id(session[:client_id]) if session[:client_id]
   # end

   def current_client
       Client.find_by(id: session[:client_id])
   end

   def is_logged_in?
       !!session[:client_id]
   end

   def require_login
       unless is_logged_in?
         flash[:message] = "Login Required."
         redirect_to '/' 
       end
   end
   
     def redirect_if_not_logged_in
         redirect_to '/' if !logged_in? 
     end 

   def logged_in?
       !current_client.nil?  
   end
end
