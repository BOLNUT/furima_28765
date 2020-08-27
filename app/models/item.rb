class Item < ApplicationRecord
  # 空文字制限(入力必須)
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
    validates :category_id
    validates :item_status_id
    validates :delivery_id
    validates :prefecture_id
    validates :time_id
    validates :user_id
  end

  # price 入力制限
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }                    # 数字のみであるか
  validates :price, :numericality => { :greater_than_or_equal_to => 300 }  # 数字が300以上であるか
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 } # 数字が9,999,999以下であるか

  belongs_to :user
end
