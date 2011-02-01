class PlansController < Application

  before_filter :authorize
  before_filter :submitted_plan?, :only => [:new, :create]
  before_filter :your_plan?, :only => [:edit, :update]

  def submitted_plan?
    if current_user.submitted == 'true'
      flash[:notice] = "YOU HAVE ALREADY SUBMITTED A BUSINESS PLAN."
      redirect_to users_url
    end
  end

  def your_plan?
    if current_user.plan.id.to_i != params[:id].to_i
      Mailtime.hacker(current_user, "Change another user's plan").deliver
      flash[:notice] = "YOUR ACCOUNT HAS BEEN FLAGGED. [ERROR CODE: 19]"
      redirect_to plans_url
    end
  end

  def parse
    render :text => BBRuby.to_html(params[:data])
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
      
      flash[:notice] = "YOU VOTED FOR A BUSINESS PLAN."
      redirect_to users_url
    else
      flash[:notice] = "PURCHASE MORE VOTES."
      redirect_to users_url
    end
  end

  # GET /plans
  def index
    users = User.find_all_by_paid "true"
    @plans = Array.new
    users.each do |u|
      @plans << u.plan
    end
  end

  # GET /plans/1
  def show
    @plan = Plan.find(params[:id])

    @title = @plan.title
    @subtitle = @plan.subtitle
    @target_title = @plan.target_title
    @target_body = BBRuby.to_html(@plan.target_body)
    @financial = BBRuby.to_html(@plan.financial)
    @status = BBRuby.to_html(@plan.status)
    @action = BBRuby.to_html(@plan.action)
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
      User.update_all({:submitted => "true"}, {:id => current_user.id})
      current_user.plan = @plan
      current_user.plan.save
      redirect_to(@plan, :notice => 'BUSINESS PLAN WAS SUCCESSFULLY CREATED.')
    else
      render :action => 'edit'
    end
  end

  # PUT /plans/1
  def update
    @plan = Plan.find(params[:id])

    if @plan.update_attributes(params[:plan])
      redirect_to(@plan, :notice => 'BUSINESS PLAN WAS SUCCESSFULLY UPDATED.')
    else
      render :action => "edit"
    end
  end

end

