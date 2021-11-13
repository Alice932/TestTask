class UsersController < ApplicationController

  def index

  end

  def new 
      @user = User.new
  end

  
  def create 
      @user = User.new(user_params)

      if(@user.save)

          sign_in @user
          
          redirect_to home_path

          
      else
          render 'new'
      end

  end

  private
  def user_params
      params.require(:user).permit(:id,:email, :name, :password, :password_confirmation)

  end
  
end
