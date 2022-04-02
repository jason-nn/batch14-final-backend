class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  def generate_jwt
    JWT.encode(
      { id: id, exp: 60.days.from_now.to_i },
      Rails.application.secrets.secret_key_base,
    )
  end

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :purchases, dependent: :destroy
  has_many :alerts, dependent: :destroy
end
