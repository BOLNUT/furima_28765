class Fee < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee

  #空文字制限
  validates :title, :text, :delivery_fee, presence: true

  #ジャンルの選択が「--」の時は保存できない
  validates :delivery_fee_id, numericality: { other_than: 1 } 
end
