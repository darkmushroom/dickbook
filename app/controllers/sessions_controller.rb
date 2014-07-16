class SessionsController < ApplicationController

#  Will check if the user is logged in a different controller...
#  before_filter :require_login, :except => [:new]

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @user = nil
    @current_user = nil
    redirect_to sign_up_path , :notice => "Logged out!"
  end

  private

  def require_login
    return if logged_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to root_url #halts the request cycle
  end

end
