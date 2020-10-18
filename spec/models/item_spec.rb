require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = Item.new(name: "", )
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  end
end