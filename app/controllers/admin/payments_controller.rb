class Admin::PaymentsController < ApplicationController
  
  def new
    @partner = OfflinePartner.find(params[:offline_partner_id])
    @payment = @partner.payments.new
  end  
  
  def create
    @partner = OfflinePartner.find(params[:offline_partner_id])
    @payment = @partner.payments.new(params[:payment])  
    # @payment.barcode_identifier = params[:payment][:barcode_identifer]
    # @payment = @partner.payments.new(params[:payment])  
  
    if @payment.save
      flash[:notice] = "Successfully made payment at #{@partner.name}."
      redirect_to admin_offline_partners_path
    else
      render 'new'
    end  
  end

end
