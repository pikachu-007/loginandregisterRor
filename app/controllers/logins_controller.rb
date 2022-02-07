class LoginsController < ApplicationController
  
  def new

  end

  def create

    user = User.find_by(email:login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      redirect_to logins_new_path, notice: "Invalid credentials"
    end

  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "Logged out!"
  end

  private 
    def login_params
      params.require(:log).permit(:email, :password)
    end

end
