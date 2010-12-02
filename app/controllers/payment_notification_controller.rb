class PaymentNotificationController < ApplicationController

  protect_from_forgery :except => [:create]

  def create

#    if params[:payment_status] == "Completed"
#
#      user_id = params[:item_number].to_i
#      if User.find(user_id).paid == true
#        # WHY WOULD YOU DO THIS AGAIN?!?!?!
#      else
#        User.find(user_id).votes += 1
#        User.find(user_id).paid = true
#      end
#
#    end
    
    PaymentNotification.create!(:status => params[:payment_status], :txn_id => params[:txn_id], :payer_email => params[:payer_email], :memo => params[:memo], :payment_date => params[:payment_date], :payment_type => params[:payment_type], :quantity => params[:quantity])
    render :nothing => true
    
  end

end
