class Provider < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :clients, through: :enrollments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


  def self.clients_for(provider_id)
    find(provider_id).clients
  end
end
