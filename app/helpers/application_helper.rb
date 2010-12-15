module ApplicationHelper
  
  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find(session[:current_user_id])
  end

# Finds the User with the ID stored in the session with the key
# :current_user_id This is a common way to handle user login in
# a Rails application; logging in sets the session value and
# logging out removes it.
  def logged_in?
    !!current_user
  end
  
end
