class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]) || nil

    puts "**" * 80
    p user
    puts "**" * 80

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      puts "#" * 80
      puts "did not log you in"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

end
