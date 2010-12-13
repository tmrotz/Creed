class HomeController < Application
  before_filter :authorize, :except => [:index, :login]

  def index
  end

  def test
    
  end

  # "Create" a login, aka "log the user in"
  def login
    user = User.authenticate(params[:username], params[:password])
    unless user.nil?
      # Save the user id in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      flash[:notice] = "Successfully Logged In"
    end
    redirect_to :root
  end

  # "Delete" a login, aka "log the user out"
  def logout
    logger.info("\n>>>> DESTROY <<<<\n\n")
    # Remove the user id from the session
    session[:current_user_id] = nil
    flash[:notice] = "Successfully Logged Out"
    redirect_to :root
  end

end
