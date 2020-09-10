require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入' do
    context "商品をが購入できる場合" do
      it "全ての情報が入力されていればは保存される" do
        expect(@item_purchase).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it "郵便番号がないと商品は購入できない" do
        @item_purchase.postcode = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postcodeを入力してください", "Postcodeは不正な値です")
      end
      it "郵便番号に'-'があると商品は購入できない" do
        @item_purchase.postcode = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postcodeは不正な値です")
      end
      it "都道府県を選択していないと商品は購入できない" do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecturecan't be blank")
      end
      it "市区町村がないと商品は購入できない" do
        @item_purchase.city = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Cityを入力してください")
      end
      it "番地がないと商品は購入できない" do
        @item_purchase.block = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Blockを入力してください")
      end
      it "電話番号がないと商品は購入できない" do
        @item_purchase.phone_number = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone numberを入力してください", "Phone numberは不正な値です")
      end
      it "電話番号が9桁だと商品は購入できない" do
        @item_purchase.phone_number = '123456789'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "電話番号が12桁だと商品は購入できない" do
        @item_purchase.phone_number = '123456789012'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "電話番号にハイフンが混ざると商品は購入できない" do
        @item_purchase.phone_number = '123-4567-8901'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone numberは不正な値です")
      end
    end
  end
end