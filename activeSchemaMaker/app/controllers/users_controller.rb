class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to '/signup'
      end
  end

  def index
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
