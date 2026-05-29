class Client < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :providers, through: :enrollments
  has_many :journal_entries, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
