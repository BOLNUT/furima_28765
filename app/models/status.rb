class Status < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status

  #空文字制限
  validates :title, :text, :item_status, presence: true

  #ジャンルの選択が「--」の時は保存できない
  validates :category_id, numericality: { other_than: 1 } 
end
