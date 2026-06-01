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
  end

  describe ".clients_for" do
    it "returns all clients for a given provider" do
      provider = create(:provider)
      client = create(:client)
      create(:enrollment, provider: provider, client: client)

      expect(Provider.clients_for(provider.id)).to include(client)
    end
  end
end
