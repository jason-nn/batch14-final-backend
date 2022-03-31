class Purchase < ApplicationRecord
  validates :user_id, presence: true
  validates :cryptocurrency_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  belongs_to :user
  belongs_to :cryptocurrency
end
