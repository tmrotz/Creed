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

  # GET /plans
  # GET /plans.xml
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show
    @plan = Plan.find(params[:id])
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.xml
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
  # PUT /plans/1.xml
  def update
    @plan = Plan.find(params[:id])

    if @plan.update_attributes(params[:plan])
      redirect_to(@plan, :notice => 'Plan was successfully updated.')
    else
      render :action => "edit"
    end
  end

end

