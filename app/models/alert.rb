class Alert < ApplicationRecord
  validates :user_id, presence: true
  validates :cryptocurrency_id, presence: true
  validates :price, presence: true
  validates :operator,
            presence: true,
            inclusion: {
              in: %w[higher lower],
            },
            uniqueness: {
              scope: %i[user_id cryptocurrency_id price operator],
            }

  belongs_to :user
  belongs_to :cryptocurrency
end
