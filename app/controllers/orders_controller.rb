class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(params_purchase)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def params_purchase
    params.require(:purchase_order).permit(:post_code, :sender_id, :town, :house_number, :building_number, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params_purchase[:token],
      currency: 'jpy'
    )
  end
end
