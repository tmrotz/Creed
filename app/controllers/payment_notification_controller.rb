class PaymentNotificationController < Application

  protect_from_forgery :except => [:create]

  def create

    if (params[:secret] == "amc95n4ioe9gjg")
      user_id = params[:item_number].to_i
      num_votes = User.find(user_id).votes
      num_votes += params[:quantity].to_i
      User.update_all({:votes => num_votes}, {:id => user_id})
      
      PaymentNotification.create!(:status => params[:payment_status], :txn_id => params[:txn_id], :payer_email => params[:payer_email], :memo => params[:memo], :payment_date => params[:payment_date], :payment_type => params[:payment_type], :quantity => params[:quantity])
    end
    
    render :nothing => true
    
  end

end
