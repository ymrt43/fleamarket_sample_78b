require 'rails_helper'
describe Profile do
  describe '#create' do
    it "is valid with params" do
      profile = build(:profile)
      expect(profile).to be_valid
    end
  end
end