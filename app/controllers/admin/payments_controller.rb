class Admin::PaymentsController < ApplicationController
  
  def new
    @partner = OfflinePartner.find(params[:offline_partner_id])
    @payment = @partner.payments.new
  end  
  
  def create
    @partner = OfflinePartner.find(params[:offline_partner_id])
    @payment = @partner.payments.new(params[:payment])
    
    if @payment.save
      Transaction.find_by_barcode(@payment.barcode_identifer).update_attribute(:state,"done")
      flash[:notice] = "Successfully made payment at #{@partner.name}."
      redirect_to admin_offline_partners_path
    else
      render 'new'
    end  
  end

end
