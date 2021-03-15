FactoryBot.define do
  factory :item do
    product_name         {'テスト'}
    product_description  {'テストテストテスト。'}
    category_id          {'2'}
    product_condition_id {'2'}
    delivery_fee_id      {'2'}
    delivery_area_id     {'2'}
    delivery_days_id     {'2'}
    price                {'1000'}
  end
end