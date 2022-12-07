class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(params[item_parameter])
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end
  

  private
  def item_parameter
    params
    .require(:items)
    .permit(:name, :cotent, :category_id, :condition_id, :delivery_charge_id, :sender_id, :delivery_day_id, :price, :image)
    .merge(user_id: current_user.id)
  end
end
