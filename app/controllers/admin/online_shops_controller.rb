class Admin::OnlineShopsController < AdminController

  def index
    @shops = OnlineShop.all
  end
  
end
