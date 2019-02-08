class SessionsController < ApplicationController
  def new
    @user = User.new
  end

#   def create
#     @user = User.find_by(email: params[:email])
#   if @user && @user.authenticate(params[:password])
#     session[:user_id] = @user.id
#     flash[:success] = "Successfully Logged In!"
#     redirect_to '/gossips'
#   else
#     flash[:warning] = "Invalid Username or Password"
#     redirect_to '/login'
#   end
# end
def create
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   flash[:success] = "Successfully Logged In!"
   redirect_to '/gossips'
  else
   flash[:warning] = "Invalid Username or Password"
   render 'new'
  end
 end

  def destroy
   # delete the saved user_id key/value from the cookie:
   session.delete(:user_id)
   redirect_to "/"
  end

end
