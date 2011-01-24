class Application < ActionController::Base
  
  protect_from_forgery
  
  private

  def authorize
    unless logged_in?
      flash[:notice] = "Please log in."
      redirect_to :root
    end
  end

# Finds the User with the ID stored in the session with the key
# :current_user_id This is a common way to handle user login in
# a Rails application; logging in sets the session value and
# logging out removes it.
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find(session[:current_user_id])
  end
  
end
