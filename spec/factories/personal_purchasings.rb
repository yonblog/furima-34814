FactoryBot.define do
  factory :personal_purchasing do
    token {'tok_abcdefghijk00000000000000000'}

    postal_code {'123-4567'}
    delivery_area_id {2}
    municipality {'テスト市'}
    address {'1−2−3'}
    building_name {'テスト'}
    phone_number {'09012345678'}
  end
end
