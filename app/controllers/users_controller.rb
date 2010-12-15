class UsersController < Application

  before_filter :authorize, :except => [:new, :create]
  before_filter :correct_user?, :only => [:edit, :update]

  def correct_user?
    if current_user.id.to_i != params[:id].to_i
      flash[:notice] = "You account has been flagged."
      redirect_to users_url
    end
  end

  # GET /users
  # GET /users.xml
  def index
    @users = User.all
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @button_text = "Create Account"
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @button_text = "Edit Account"
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.paid = 'false'
    @user.votes = 0
    

    if @user.save
      redirect_to(users_url, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end

  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(users_url, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

end
