class UsersController < Application

  before_filter :authorize, :except => [:new, :create]
  before_filter :correct_user?, :only => [:edit, :update]

  def correct_user?
    if current_user.id.to_i != params[:id].to_i
      Mailtime.hacker(current_user, "Access another user's account").deliver
      flash[:notice] = "YOUR ACCOUNT HAS BEEN FLAGGED. [ERROR CODE: 78]"
      redirect_to users_url
    end
  end

#  def activate
#
#  end

  # GET /users
  def index
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:current_user_id] = @user.id
      Mailtime.welcome(@user).deliver
      redirect_to(users_url, :notice => "YOUR ACCOUNT WAS SUCCESSFULLY CREATED.")
    else
      render :action => "new"
    end

  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(users_url, :notice => 'YOUR ACCOUNT WAS UPDATED SUCCESSFULLY.')
    else
      render :action => "edit"
    end
  end

end
