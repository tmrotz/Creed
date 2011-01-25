class PlansController < Application

  before_filter :authorize
  before_filter :bought_plan?, :except => [:index, :show]
  before_filter :submitted_plan?, :only => [:new, :create]
  before_filter :your_plan?, :only => [:edit, :update]
#  before_filter :your_schools_plan?, :only => [:show, :vote]

  def bought_plan?
    if current_user.paid == 'false'
      flash[:notice] = "YOU MUST PURCHASE A BUSINESS PLAN."
      redirect_to users_url
    end
  end

  def submitted_plan?
    if current_user.paid == 'submitted'
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

#  def your_schools_plan?
#    plan = Plan.find(params[:id])
#    if current_user.school_id.to_i != plan.user.school_id.to_i
#     Mailtime.welcome(@user, "Access different school's plan").deliver
#      flash[:notice] = "Your account has been flagged.[Error code: 23]"
#      redirect_to plans_url
#    end
#  end

  def vote
    if current_user.votes > 0
      plan = Plan.find(params[:plan_id].to_i)
      num_votes = plan.votes
      num_votes += 1
      Plan.update_all({:votes => num_votes}, {:id => plan.id})

      num_votes = current_user.votes
      num_votes -= 1
      User.update_all({:votes => num_votes}, {:id => current_user.id})
      
      flash[:notice] = "YOU HAVE #{current_user.votes} VOTES LEFT."
      redirect_to users_url
    else
      flash[:notice] = "PURCHASE MORE VOTES."
      redirect_to users_url
    end
  end

  # GET /plans
  def index
#    users = User.find_all_by_school_id(current_user.school_id)
#    @plans = Array.new
#    users.each do |u|
#      @plans << u.plan if u.plan != nil
#    end
    @plans = Plan.all
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

    if @plan.save!
      User.update_all({:paid => "submitted"}, {:id => current_user.id})
      current_user.plan = @plan
      current_user.plan.save
      redirect_to(@plan, :notice => 'BUSINESS PLAN WAS SUCCESSFULLY CREATED.')
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

