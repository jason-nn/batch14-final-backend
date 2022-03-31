class Alert < ApplicationRecord
  validates :user_id, presence: true
  validates :cryptocurrency_id, presence: true
  validates :price, presence: true
  validates :operator, presence: true, inclusion: { in: %w[higher lower] }

  belongs_to :user
  belongs_to :cryptocurrency
end
