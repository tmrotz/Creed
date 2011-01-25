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

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
    @button_text = "Create Account"
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @button_text = "Confirm"
  end

  # POST /users
  def create
    @user = User.new(params[:user])
#    @user.paid = 'false'
#    @user.votes = 0

    
    if @user.save!
      Mailtime.welcome(@user).deliver
      redirect_to(:root, :notice => "YOUR ACCOUNT WAS SUCCESSFULLY CREATED.")
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
