class OrdersController < ApplicationController
  before_action :authenticate_user!
  #before_action :non_ordered_item, only: [:index, :create]

  def index
    @order_payment = OrderPayment.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new(order_payment_params)
    if @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end 
  end



  private

  def order_payment_params
    # この時点では、order_idが不要。またrequire外の情報は参照するため、mergeとする。
    params.require(:order_payment).permit(:item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "pk_test_e2d68cd880b9412a45c32774"
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end