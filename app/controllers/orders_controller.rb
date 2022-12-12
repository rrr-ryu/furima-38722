class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(params_purchase)
    if 
      @purchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def params_purchase
    params.permit(:post_code, :sender_id, :town, :house_number, :building_number, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end  
end
