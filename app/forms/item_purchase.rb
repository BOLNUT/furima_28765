class ItemPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id, :token

  #空文字制限
  with_options presence: true do
    validates :postcode,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入の情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Receiver.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end