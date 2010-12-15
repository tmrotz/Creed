class PlansController < Application

  before_filter :authorize
  before_filter :bought_plan?, :except => [:index, :show]
  before_filter :submitted_plan?, :only => [:new, :create]
  before_filter :your_plan?, :only => [:edit, :update]

  def bought_plan?
    if current_user.paid == 'false'
      flash[:notice] = "You must purchase a business plan."
      redirect_to users_url
    end
  end

  def submitted_plan?
    if current_user.paid == 'submitted'
      flash[:notice] = "You have already submitted a business plan."
      redirect_to users_url
    end
  end

  def your_plan?
    if current_user.plan.id.to_i != params[:id].to_i
      flash[:notice] = "You account has been flagged."
      redirect_to plans_url
    end
  end

  def vote
    if current_user.votes > 0
      plan = Plan.find(params[:plan_id].to_i)
      num_votes = plan.votes
      num_votes += 1
      Plan.update_all({:votes => num_votes}, {:id => plan.id})

      num_votes = current_user.votes
      num_votes -= 1
      User.update_all({:votes => num_votes}, {:id => current_user.id})
      
      flash[:notice] = "You have #{current_user.votes} votes left."
      redirect_to users_url
    else
      flash[:notice] = "Purchase more votes."
      redirect_to users_url
    end
  end

  # GET /plans
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  def show
    @plan = Plan.find(params[:id])
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    @button_text = "Create Plan"
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
    @button_text = "Confirm Plan Change"
  end

  # POST /plans
  def create
    @plan = Plan.new(params[:plan])

    if @plan.save
      User.update_all({:paid => "submitted"}, {:id => current_user.id})
      current_user.plan = @plan
      current_user.plan.save
      redirect_to(@plan, :notice => 'Plan was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /plans/1
  def update
    @plan = Plan.find(params[:id])

    if @plan.update_attributes(params[:plan])
      redirect_to(@plan, :notice => 'Plan was successfully updated.')
    else
      render :action => "edit"
    end
  end

end

