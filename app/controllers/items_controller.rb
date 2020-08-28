class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @discrimination = Discrimination.new
    @status = Status.new
  end
  
  def create
    Item.create(item_params)
    
    #active_hash使用
    @discrimination = Discrimination.new(discrimination_params)
    if @discrimination.save
      redirect_to root_path
    else
      render :new
    end

    @status = Status.new(status_params)
    if @status.save
      redirect_to root_path
    else
      render :new
    end
    #//active_hash使用
  end
   
   private
    def item_params
      params.require(:items).permit(
        :image, :name, :text, :price, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :time_id, :user_id
      ) #active_hash使用               :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :time_id  外部キー:user_id
    end

    def discrimination_params
      params.require(:discrimination).permit(:title,:text,:category_id)
    end

    def status_params
      params.require(:status).permit(:title,:text,:item_status_id)
    end
end

