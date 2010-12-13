module ApplicationHelper

  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find(session[:current_user_id])
  end

  def logged_in?
    !!current_user
  end

end
