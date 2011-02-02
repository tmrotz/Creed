class HomeController < Application
  
  before_filter :authorize, :except => [:index, :register, :login, :forgot, :contact]

  def index
    render :layout => "homepage"
  end

  def contact
    
  end

  def forgot
    user = User.find_by_email(params[:email])
    if user.nil?
      flash[:notice] = "THAT EMAIL IS NOT IN OUR DATABASE. TRY AGAIN."
      redirect_to :root
    else
      user.send_new_password
      flash[:notice] = "AN EMAIL HAS BEEN SENT WITH A NEW PASSWORD."
      redirect_to :root
    end
  end

  def register
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
      flash[:notice] = "USERNAME/PASSWORD DID NOT MATCH."
      redirect_to :root
    end
  end

  # "Delete" a login, aka "log the user out"
  def logout
    # Remove the user id from the session
    session[:current_user_id] = nil
    redirect_to :root
  end

end
