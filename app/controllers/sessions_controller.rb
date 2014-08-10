class SessionsController < ActionController::Base
  before_filter :require_login, except: [:new, :create]

  helper_method :current_user

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_url
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_url , :notice => "Logged out!"
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    return if logged_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to root_url
  end
end
