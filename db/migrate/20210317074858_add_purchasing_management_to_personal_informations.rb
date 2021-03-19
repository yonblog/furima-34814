class AddPurchasingManagementToPersonalInformations < ActiveRecord::Migration[6.0]
  def change
    add_reference :personal_informations, :purchasing_management, null: false, foreign_key: true
  end
end
