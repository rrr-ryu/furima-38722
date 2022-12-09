class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_parameter)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_parameter
    params.require(:item)
          .permit(:name, :content, :category_id, :condition_id, :delivery_charge_id, :sender_id, :delivery_day_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if current_user.id == @item.user.id

    redirect_to items_path
  end
end