class PlansController < Application

before_filter :authorize
before_filter :bought_plan?, :except => [:index, :show]
before_filter :submitted_plan?, :only => [:new, :create]

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

  # GET /plans
  # GET /plans.xml
  def index
    @plans = Plan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.xml
  def create
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        User.update_all({:paid => "submitted"}, {:id => current_user.id})
        format.html { redirect_to(@plan, :notice => 'Plan was successfully created.') }
        format.xml  { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.xml
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.xml
  def destroy
  end

end

