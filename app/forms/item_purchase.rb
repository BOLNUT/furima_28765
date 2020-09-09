class ItemPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id

  with_options presence: true do
    validates :postcode,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入の情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, purchase_id: purchase.id)
  end
end