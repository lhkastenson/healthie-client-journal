class Provider < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :clients, through: :enrollments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
