class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :DESC)
    @count = Item.count
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to items_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  

  private

  def item_parameter
    params.require(:item)
          .permit(:name, :content, :category_id, :condition_id, :delivery_charge_id, :sender_id, :delivery_day_id, :price, :image)
          .merge(user_id: current_user.id)
  end
end
