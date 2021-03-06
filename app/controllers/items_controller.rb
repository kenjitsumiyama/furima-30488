class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, only: [:edit]
  before_action :set_items, only: [:edit, :show, :update, :destroy]
  before_action :set_redirect_to_root, only: [:update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :shipping_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == item.user.id
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def set_redirect_to_root
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user.id
  end
end
