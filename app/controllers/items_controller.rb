class ItemsController < ApplicationController
  
  def index
    @items = Item.all
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
   
   private
    def item_params
      params.require(:item).permit(:image, :name, :text, :price, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :user_id).merge(user_id: current_user.id)
    end
end

