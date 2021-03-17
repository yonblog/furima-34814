class PurchasingManagement < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :personal_information
end
