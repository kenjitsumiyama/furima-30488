require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "画像、商品名、商品の説明が存在し、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数が選択されていると出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品の出品ができない場合" do
      it "画像がないと、出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end   

      it "商品名がないと、出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと、出品できない" do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      
      it "カテゴリーを選択していないと、出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態を選択していないと、出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担を選択していないと、出品できない"do
        @item.shipping_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end

      it "発送元の地域を選択していないと、出品できない"do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数を選択していないと、出品できない" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end

      it "価格がないと、出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300より安いと、出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が9999999より高いと、出品できない" do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格が半角数字ではないと、出品できない" do
        @item.price = 'aあ1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      
    end
  end
end 
