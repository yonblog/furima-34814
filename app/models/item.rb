class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_days

  validates :category_id, :product_condition_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id, numericality: { other_than: 1 } 
end
