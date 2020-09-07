class Purchase < ApplicationRecord
  has_one :receiver
  belongs_to :item
  belongs_to :user
end
