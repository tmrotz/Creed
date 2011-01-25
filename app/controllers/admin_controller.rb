class AdminController < Application

  before_filter :check_admin

  def check_admin
    if current_user.nil?
      flash[:notice] = "NIL USER. [ERROR CODE: 13]"
      redirect_to :root
    elsif current_user.username != "tmrotz"
      Mailtime.hacker(current_user, "Access admin control").deliver
      flash[:notice] = "YOUR ACCOUNT HAS BEEN FLAGGED. [ERROR CODE: 63]"
      redirect_to :root
    end
  end

  def index
    @plans = Plan.order("votes").reverse!
    render :layout => false
  end

end
