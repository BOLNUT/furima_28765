require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:tweet)
  end

  describe '商品出品の保存' do
    context "商品情報が保存できる場合" do
      it "画像とテキストがあればツイートは保存される" do
      end
      it "テキストのみあればツイートは保存される" do
      end
    end
    context "商品情報が保存できない場合" do
      it "テキストがないとツイートは保存できない" do
      end     
      it "ユーザーが紐付いていないとツイートは保存できない" do
      end
    end
  end
end
