class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end
   
   private
    def item_params
      params.require(:item).permit(:image, :name, :text, :price, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :user_id).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end

