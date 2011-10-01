class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to '/' unless current_user && current_user.admin? && current_user.active?
  end

end
