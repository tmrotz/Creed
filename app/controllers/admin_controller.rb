class AdminController < Application
  
  def index
    @plans = Plan.order("votes").reverse
    @users = User.all
    @payments = PaymentNotification.all
    render :layout => false
  end

end
