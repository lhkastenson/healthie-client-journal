require "rails_helper"

RSpec.describe Client, type: :model do
  describe "validations" do
    it "is valid with a name and email" do
      client = build(:client)
      expect(client).to be_valid
    end

    it "is invalid without a name" do
      client = build(:client, name: nil)
      expect(client).not_to be_valid
    end

    it "is invalid without an email" do
      client = build(:client, email: nil)
      expect(client).not_to be_valid
    end

    it "is invalid with a duplicate email" do
      create(:client, email: "test@test.com")
      client = build(:client, email: "test@test.com")
      expect(client).not_to be_valid
    end
  end

  describe ".providers_for" do
    it "returns the providers for a given client_id" do
      client = create(:client)
      provider = create(:provider)
      create(:enrollment, client: client, provider: provider)
      expect(Client.providers_for(client.id)).to include(provider)
    end
  end

  describe ".journal_entries_for" do
    it "returns the journal_entries for a given client_id" do
      client = create(:client)
      journal_entry = create(:journal_entry, client: client)
      expect(Client.journal_entries_for(client.id)).to include(journal_entry)
    end
  end
end
