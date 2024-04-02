class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, non_purchased_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_payment = OrderPayment.new
    
  end

  def create
    
    @order_payment = OrderPayment.new(order_payment_params)
    if @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end 
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_payment_params
    # この時点では、order_idが不要。またrequire外の情報は参照するため、mergeとする。
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: order_payment_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end