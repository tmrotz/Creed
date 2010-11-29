class PaymentNotificationController < ApplicationController

  protect_from_forgery :except => [:create]

  def create
    if params[:secret] == "b2g36f9rty8jk1g2f6"
      PaymentNotification.create!(:status => params[:payment_status], :txn_id => params[:txn_id], :payer_email => params[:payer_email], :memo => params[:memo], :payment_date => params[:payment_date], :payment_type => params[:payment_type], :quantity => params[:quantity])
      render :nothing => true
    end
  end

end
