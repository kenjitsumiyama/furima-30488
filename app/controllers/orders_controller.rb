class OrdersController < ApplicationController
  before_action :set_items, only: [:index, :create]
  def index  
    # @item = Item.find(params[:item_id])
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @order_address = OrderAddress.new
  end

  def create
    

    # @item = Item.find(params[:item_id])
    
    @order_address = OrderAddress.new(order_params)
    

    if @order_address.valid?
    
       @order_address.save
       redirect_to root_path
       else
      

      render :index  
    end
  end

 private

   def order_params
    params.require(:order_address).permit(:user_id,:item_id,:order_id,:postal_code,:city,:address,:building,:prefecture_id,:phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id])
   end


  def set_items
    @item = Item.find(params[:item_id])
  end
end