class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :percentage_transactions
  
  def percentage_transactions(status)
    state = Transaction.where(:state => status).count
    total = Transaction.count
    percent = 100* (state.to_f/total.to_f)
    percent.round(2)
  end
end
