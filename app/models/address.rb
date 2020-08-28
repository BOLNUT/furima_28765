class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  #空文字制限
  validates :title, :text, :prefecture, presence: true

  #ジャンルの選択が「--」の時は保存できない
  validates :prefecture_id, numericality: { other_than: 1 } 
end
