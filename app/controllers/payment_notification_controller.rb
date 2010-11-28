class PaymentNotificationController < ApplicationController

  protect_from_forgery :except => [:create]

  def create
    PaymentNotification.create!(:status => params[:payment_status], :txn_id => params[:txn_id], :payer_email => params[:payer_email], :memo => params[:memo], :payment_date => params[:payment_date], :payment_type => params[:payment_type], :qauntity => params[:quantity])
    render :nothing => true
  end

end
