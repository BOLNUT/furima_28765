class DeliveryTime < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_day

  #空文字制限
  validates :title, :text, :delivery_day, presence: true

  #ジャンルの選択が「--」の時は保存できない
  validates :delivery_day_id, numericality: { other_than: 1 } 
end
