class Admin::OfflinePartnersController < AdminController

  def index
    @partners = OfflinePartner.all
  end

end
