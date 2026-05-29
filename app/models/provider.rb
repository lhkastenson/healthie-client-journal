class Provider < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :clients, through: :enrollments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


  def self.clients_for(provider_id)
    find(provider_id).clients
  end

  def self.journal_entries_for(provider_id)
    JournalEntry.joins(client: :providers)
      .where(providers: { id: provider_id })
      .order(created_at: :desc)
  end
end
