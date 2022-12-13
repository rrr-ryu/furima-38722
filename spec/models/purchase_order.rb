require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入出来る場合' do
      it '全ての情報が正しく入力されている時' do
        expect(@purchase_order).to be_valid
      end

      it 'building_numberが空の時' do
        @purchase_order.building_number = ''
        @purchase_order.valid?
        expect(@purchase_order).to be_valid
      end
    end
    context '商品購入出来ない時' do
      it 'post_codeが空の時' do
        @purchase_order.post_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeの正規表現が守られていない時' do
        @purchase_order.post_code = '12345678'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'sender_idが空の時' do
        @purchase_order.sender_id = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Sender can't be blank")
      end

      it 'sender_idが1の時' do
        @purchase_order.sender_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Sender can't be blank")
      end

      it 'townが空の時' do
        @purchase_order.town = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Town can't be blank")
      end

      it 'house_numberが空の時' do
        @purchase_order.house_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空の時' do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberの正規表現が守られてない時' do
        @purchase_order.phone_number = '090-1234-5678'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁以下の時' do
        @purchase_order.phone_number = '090123456'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上の時' do
        @purchase_order.phone_number = '090123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空の時' do
        @purchase_order.token = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_idが空の時' do
        @purchase_order.item_id = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空の時' do
        @purchase_order.user_id = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
