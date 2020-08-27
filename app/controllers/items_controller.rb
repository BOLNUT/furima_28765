class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params) #モデル名.create(引数名)
  end
   
   private
    def item_params
      params.require(:items).permit(
        :image, :name, :text, :price, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :time_id, :user_id
      ) #active_hash使用       :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :time_id  外部キー:user_id
    end
   
end

