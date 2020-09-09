class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
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
    params.permit(:token, :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      buyer:   purchace_params[:user_id], #購入したユーザー
      product: purchace_params[:item_id], #購入された商品
      card:    purchace_params[:token],   # カードトークン
      currency:'jpy'                      # 通貨の種類(日本円)
    )
  end
end
