class PaymentNotificationController < Application

  protect_from_forgery :except => [:create]

  def create

    if (params[:secret] == "amc95n4ioe9gjg")
      user_id = params[:item_number].to_i
      user = User.find(user_id)
      user.votes += 1
      user.paid = true
      
      PaymentNotification.create!(:status => params[:payment_status], :txn_id => params[:txn_id], :payer_email => params[:payer_email], :memo => params[:memo], :payment_date => params[:payment_date], :payment_type => params[:payment_type], :quantity => params[:quantity])
    end
    
    render :nothing => true
    
  end

end
