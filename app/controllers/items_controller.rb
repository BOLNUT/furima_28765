class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new

    #new active_hash使用
    @discrimination = Discrimination.new
    @status = Status.new
    @fee = Fee.new
    @address = Address.new
    @delivery_time = DeliveryTime.new
    #//new active_hash使用
  end
  
  def create
    Item.create(item_params)
    
    #create active_hash使用
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

    @fee = Fee.new(fee_params)
    if @fee.save
      redirect_to root_path
    else
      render :new
    end

    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new
    end

    @delivery_time = DeliveryTime.new(delivery_time_params)
    if @delivery_time.save
      redirect_to root_path
    else
      render :new
    end

    #//create active_hash使用
  end
   
   private
    def item_params
      params.require(:items).permit(
        :image, :name, :text, :price, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :user_id
      )
    end
    #params active_hash使用
    def discrimination_params
      params.require(:discrimination).permit(:title,:text,:category_id)
    end

    def status_params
      params.require(:status).permit(:title,:text,:item_status_id)
    end

    def fee_params
      params.require(:fee).permit(:title,:text,:delivery_fee_id)
    end

    def address_params
      params.require(:address).permit(:title,:text,:prefecture_id)
    end

    def delivery_time_params
      params.require(:delivery_time).permit(:title,:text,:delivery_day_id)
    end
    #//params active_hash使用
end

