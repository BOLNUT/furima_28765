class Purchase < ApplicationRecord
  has_one :receiver
  belongs_to :item
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
end
