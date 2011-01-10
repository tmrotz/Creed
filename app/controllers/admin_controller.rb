class AdminController < Application

  before_filter :check_admin

  def check_admin
    if current_user.username != "tmrotz"
      Mailtime.hacker(current_user, "Access admin control").deliver
      flash[:notice] = "Your account has been flagged.[Error code: 63]"
      redirect_to index_url
    end
  end

  def index
    render :layout => false
    @plans = Plan.all
  end

end
