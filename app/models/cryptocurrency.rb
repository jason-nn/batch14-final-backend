class Cryptocurrency < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :symbol, presence: true, uniqueness: true
  validates :price, presence: true

  has_many :purchases, dependent: :destroy
  has_many :alerts, dependent: :destroy
end
