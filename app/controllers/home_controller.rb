class HomeController < Application
  
  before_filter :authorize, :except => [:index, :register, :login]

  def index
  end

  def register
    @user = User.new
  end

  # "Create" a login, aka "log the user in"
  def login
    user = User.authenticate(params[:username], params[:password])
    unless user.nil?
      # Save the user id in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to users_url
    else
      flash[:notice] = "username/password did not match"
      redirect_to register_url
    end
  end

  # "Delete" a login, aka "log the user out"
  def logout
    # Remove the user id from the session
    session[:current_user_id] = nil
    redirect_to :root
  end

end
