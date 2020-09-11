class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = ItemPurchase.new
  end
  
  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.permit(:token, :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def item_price
    @purchase.item.price
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_price(),  # 商品の値段
      card:   params[:token],   # カードトークン
      currency:'jpy'                      # 通貨の種類(日本円)
    )
  end
end
