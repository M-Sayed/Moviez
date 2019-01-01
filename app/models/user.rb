class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :favorite_list, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
