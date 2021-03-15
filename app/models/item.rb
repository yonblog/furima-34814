class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_days

  validates :category_id, :product_condition_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id, numericality: { other_than: 1, message: 'Select' } 
  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_days_id
    validates :price
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, allow_blank: true
  end

  def was_attached?
    self.image.attached?
  end
end
