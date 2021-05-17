require 'rails_helper'

RSpec.describe PurchaseAddressee, type: :model do
  describe '購入情報の登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_addressee = FactoryBot.build(:purchase_addressee, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されている場合、保存ができる' do
        expect(@purchase_addressee).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存ができない' do
        @purchase_addressee.post_code = ''
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが含まれた半角でなければ保存ができない' do
        @purchase_addressee.post_code = '１２３４５６７'
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空では保存ができない' do
        @purchase_addressee.prefecture_id = ''
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では保存ができない' do
        @purchase_addressee.municipality = ''
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では保存ができない' do
        @purchase_addressee.address = ''
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Address can't be blank")
      end
      it 'building_nameが空でも保存ができること' do
        @purchase_addressee.building_name = ''
        expect(@purchase_addressee).to be_valid
      end
      it 'tel_numberが空では保存ができないこと' do
        @purchase_addressee.tel_number = ''
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Tel number can't be blank", "Tel number is invalid")
      end
      it 'tel_numberは11桁以下の半角でなければ保存できない' do
        @purchase_addressee.tel_number = '１２３４５６７８９'
        @purchase_addressee.valid?
        expect(@purchase_addressee.errors.full_messages).to include("Tel number is invalid")
      end
    end
  end
end
