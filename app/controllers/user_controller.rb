class UserController < ApplicationController

  def new
    @user = User.all
    @city = City.all
  end


  def create
    @city = City.all
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      description: params[:description],
      city_id: 1,
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "inscription fait"
      redirect_to '/'
    else
      puts "="*90
      puts @user.errors.full_messages
      puts "="*90
      flash[:warning] = 'abuseur'
      render 'new'
    end
  end


end
