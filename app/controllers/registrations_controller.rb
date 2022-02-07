class RegistrationsController < ApplicationController
  
  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id]=user.id
      redirect_to home_index_path, notice: "User Created"
    else 
      redirect_to home_index_path, notice: "Error Creating User"
    end
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :confirm_password)
    end
  
end
