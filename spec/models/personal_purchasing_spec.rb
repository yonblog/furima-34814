require 'rails_helper'

RSpec.describe PersonalPurchasing, type: :model do
  before do
    user = FactoryBot.create(:user)
    image = fixture_file_upload('app/assets/images/test.jpeg')
    item = FactoryBot.create(:item, user_id: user.id, image: image)
    @personal_purchasing = FactoryBot.build(:personal_purchasing, user_id: user.id, item_id: item.id, )
    sleep 0.1
  end
      
  describe '商品購入' do
    context '商品購入できるとき'do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@personal_purchasing).to be_valid
      end
      it '建物名が空でも登録できる' do
        @personal_purchasing.building_name = ''
        expect(@personal_purchasing).to be_valid
      end
    end



    context '商品購入できないとき' do
      it 'tokunが空だと登録できない' do
        @personal_purchasing.token = ''
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @personal_purchasing.postal_code = nil
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが無いと登録できない' do
        @personal_purchasing.postal_code = 1234567
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Postal code is invalid. Please enter the correct number and hyphen (-)")
      end
      it 'postal_codeが「3桁-4桁」でないと登録できない' do
        @personal_purchasing.postal_code = 1234-567
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Postal code is invalid. Please enter the correct number and hyphen (-)")
      end
      it 'postal_codeが英数字だと登録できない' do
        @personal_purchasing.postal_code = '123-abcd'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Postal code is invalid. Please enter the correct number and hyphen (-)")
      end
      it 'postal_codeが英字だと登録できない' do
        @personal_purchasing.postal_code = 'abc-defg'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Postal code is invalid. Please enter the correct number and hyphen (-)")
      end
      it 'postal_codeが全角だと登録できない' do
        @personal_purchasing.postal_code = '１２３−４５６７'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Postal code is invalid. Please enter the correct number and hyphen (-)")
      end
      it 'delivery_area_idが「1」だと登録できない' do
        @personal_purchasing.delivery_area_id = 1
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Delivery area Select")
      end
      it 'municipalityが空だと登録できない' do
        @personal_purchasing.municipality = ''
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと登録できない' do
        @personal_purchasing.address = ''
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @personal_purchasing.phone_number = nil
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが8桁以下だと登録できない' do
        @personal_purchasing.phone_number = '09012345'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Phone number Enter a 10- or 11-digit number")
      end
      it 'phone_numberが英数字だと登録できない' do
        @personal_purchasing.phone_number = '0901234abc'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Phone number Enter a 10- or 11-digit number")
      end
      it 'phone_numberが英字だと登録できない' do
        @personal_purchasing.phone_number = 'abcdefghij'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Phone number Enter a 10- or 11-digit number")
      end
      it 'phone_numberが全角だと登録できない' do
        @personal_purchasing.phone_number = '０９０１２３４５６７８'
        @personal_purchasing.valid?
        expect(@personal_purchasing.errors.full_messages).to include("Phone number Enter a 10- or 11-digit number")
      end
    end
  end
end






