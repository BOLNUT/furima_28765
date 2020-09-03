class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  # 空文字制限(入力必須)
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end


  # price 入力制限
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }                    # 数字のみであるか
  validates :price, :numericality => { :greater_than_or_equal_to => 300 }  # 数字が300以上であるか
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 } # 数字が9,999,999以下であるか

end
