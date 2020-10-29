class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_items, only: [:index, :create]
  before_action :set_redirect_to_root
  before_action :item_nil_redirect_to_root

  def index  
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      
       pay_item
      
       @order_address.save
       redirect_to root_path
       else
       render :index  
    end
  end

 private

   def order_params
    params.require(:order_address).permit(:user_id,:item_id,:order_id,:postal_code,:city,:address,:building,:prefecture_id,:phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end

   def set_items
    @item = Item.find(params[:item_id])
   end

   def set_redirect_to_root
    redirect_to root_path if user_signed_in? && current_user.id == @item.user.id
   end

   def item_nil_redirect_to_root
    redirect_to_root_path if @item.order != nil
   end

   def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
   end
end

