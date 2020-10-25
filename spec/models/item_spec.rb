require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      seller = create(:user)
      category = create(:category)
      @item = build(:item, :with_ten_images, seller_id: seller.id, category_id: category.id)
      @item_no_img = build(:item, seller_id: seller.id, category_id: category.id)
      @item_has_eleven = build(:item, :with_eleven_images, seller_id: seller.id, category_id: category.id)
    end

    # saveできるテスト
    context 'can save' do
      # ブランド有で出品できる
      it "is valid with name, description, brand, state, fee, term, price, prefecture, category, seller, and 10images" do
        expect(@item).to be_valid
      end
      
      # ブランド無で出品できる
      it "is valid with name, description, state, fee, term, price, prefecture, category, user, and 10images" do
        @item.brand = ""
        @item.valid?
        expect(@item).to be_valid
      end
    end
    
    # バリデーションテスト
    context 'can not save' do
      # nameが空では出品できない
      it "is invalid without a name" do
        @item.name = ""
        @item.valid?
        expect(@item.errors[:name]).to include("を入力してください")
      end
      # descriptionが空では出品できない
      it "is invalid without a description" do
        @item.description = ""
        @item.valid?
        expect(@item.errors[:description]).to include("を入力してください")
      end
      # stateが空では出品できない
      it "is invalid without a state" do
        @item.state = ""
        @item.valid?
        expect(@item.errors[:state]).to include("を入力してください")
      end
      # feeが空では出品できない
      it "is invalid without a fee" do
        @item.fee = ""
        @item.valid?
        expect(@item.errors[:fee]).to include("を入力してください")
      end
      # termが空では出品できない
      it "is invalid without a term" do
        @item.term = ""
        @item.valid?
        expect(@item.errors[:term]).to include("を入力してください")
      end
      # priceが空では出品できない
      it "is invalid without a price" do
        @item.price = ""
        @item.valid?
        expect(@item.errors[:price]).to include("を入力してください")
      end
      # prefecture_idが空では出品できない
      it "is invalid without a prefecture_id" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors[:prefecture]).to include("を入力してください")
      end
      # category_idが空では出品できない
      it "is invalid without a category_id" do
        @item.category_id= ""
        @item.valid?
        expect(@item.errors[:category]).to include("を入力してください")
      end
      # seller_idが空では出品できない
      it "is invalid without a seller_id" do
        @item.seller_id= ""
        @item.valid?
        expect(@item.errors[:seller]).to include("を入力してください")
      end

      # 画像が0枚では出品できない
      it "is invalid without a image" do
        @item_no_img.valid?
        expect(@item_no_img.errors[:images]).to include("を入力してください")
      end
      
      # 画像が11枚では出品できない
      it "is invalid with 11 image" do
        @item_has_eleven.valid?
        expect(@item_has_eleven.errors[:images]).to include("は10文字以内で入力してください")
      end
      
      # nameが41文字以上であれば出品できない
      it "is invalid with a name that has more than 41 characters " do
        @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @item.valid?
        expect(@item.errors[:name]).to include("最大40文字まで使えます")
      end

      # descriptionが1001文字以上であれば出品できない
      it "is invalid with a description that has more than 1001 characters " do
        # @item.description.length == 1001
        @item.description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors[:description]).to include("最大1000文字まで使えます")
      end
      
      # priceが10,000,000以上であれば出品できない
      it "is invalid with a price that includes more than 10,000,000" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors[:price]).to include("は9999999以下の値にしてください")
      end

      # priceが299以下であれば出品できない
      it "is invalid with a price that includes less than 299" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors[:price]).to include("は300以上の値にしてください")
      end

    end
  end
end