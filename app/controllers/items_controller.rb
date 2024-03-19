class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :edit]
  before_action :set_item, only: :show
  def index
   @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path
    end
  end  

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

    private
    def item_params
      params.require(:item).permit(:name, :description, :category_id, :prefecture_id, :price, :item_status_id, :shipping_cost_id, :shipping_date_id ,:image).merge(user_id: current_user.id)
    end
end