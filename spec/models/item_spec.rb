require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context "商品情報が保存できる場合" do
      it "全ての情報が入力されていればは保存される" do
        expect(@item).to be_valid
      end
    end
    context "商品情報が保存できない場合" do
      it "商品名がないと商品情報は保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "説明文がないと商品情報は保存できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明文を入力してください")
      end
      it "カテゴリーが未選択だと商品情報は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "商品の状態が未選択だと保存できない" do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it "配送料の負担が未選択だと保存できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it "発送元の地域が未選択だと保存できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it "発送までの日数が未選択だと保存できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it "価格を入力していないと保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格を入力してください", "商品価格は不正な値です", "商品価格は数値で入力してください")
      end
      it "価格が300円未満だと保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("商品価格は300以上の値にしてください")
      end
      it "価格が9,999,999円を超えると保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end     
      it "ユーザーが紐付いていないと商品情報は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
