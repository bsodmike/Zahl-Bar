class Admin::TransactionsController < AdminController
  def index
    @shop = OnlineShop.find(params[:online_shop_id])
    @transactions = Transaction.all
  end
  
  def new
    @shop = OnlineShop.find(params[:online_shop_id])
    @transaction = @shop.transactions.new
  end
  
  def create
    @shop = OnlineShop.find(params[:online_shop_id])
    @transaction = @shop.transactions.new(params[:transaction])
    
    if @transaction.save
      flash[:notice] = "Successfully created transaction for #{@shop.name}."
      redirect_to admin_online_shop_transaction_path(@shop, @transaction)
    else
      render 'new'
    end  
  end
  
  def show
    @shop = OnlineShop.find(params[:online_shop_id])
    @transaction = Transaction.find(params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        @example_text = "some text"
        render :pdf => "file_name",
               :template => 'layouts/pdf.html.erb',
               :layout => 'pdf',
               :footer => {
                  :center => "Center",
                  :left => "Left",
                  :right => "Right"
               }
        end
    end
  end
  
end
