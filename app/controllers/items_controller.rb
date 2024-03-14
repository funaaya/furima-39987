class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
   # @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

    private
    def item_params
      params.require(:item).permit(:name, :description, :category_id, :prefecture_id, :price, :item_status_id, :shipping_cost_id, :shipping_date_id ,:image).merge(user_id: current_user.id)
    end
end