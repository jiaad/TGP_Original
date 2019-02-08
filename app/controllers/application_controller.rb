class ApplicationController < ActionController::Base

   helper_method :current_user

 def current_user
   if session[:user_id]
     @current_user ||= User.find(session[:user_id])
   else
     @current_user = nil
   end
 
end

private

def logged_in?
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :logged_in?

end
