require "rails_helper"

RSpec.describe Provider, type: :model do
  describe "validations" do
    it "is valid with a name and email" do
      provider = build(:provider)
      expect(provider).to be_valid
    end

    it "is invalid without a name" do
      provider = build(:provider, name: nil)
      expect(provider).not_to be_valid
    end

    it "is invalid without an email" do
      provider = build(:provider, email: nil)
      expect(provider).not_to be_valid
    end

    it "is invalid with a duplicate email" do
      create(:provider, email: "test@test.com")
      provider = build(:provider, email: "test@test.com")
      expect(provider).not_to be_valid
    end
  end

  describe ".clients_for" do
    it "returns all clients for a given provider" do
      provider = create(:provider)
      client = create(:client)
      create(:enrollment, provider: provider, client: client)

      expect(Provider.clients_for(provider.id)).to include(client)
    end
  end

  describe ".journal_entries_for" do
    it "returns all journal_entries for a given provider" do
      provider = create(:provider)
      client = create(:client)
      create(:enrollment, provider: provider, client: client)
      journal_entry = create(:journal_entry, client: client)

      expect(Provider.journal_entries_for(provider.id)).to include(journal_entry)
    end
  end
end
