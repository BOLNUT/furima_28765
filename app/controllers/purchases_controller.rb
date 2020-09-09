class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:item_purchase).permit(:token, :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :user_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_params[:price],  # 商品の値段
      card:    purchace_params[:token],   # カードトークン
      currency:'jpy'                      # 通貨の種類(日本円)
    )
  end
end
