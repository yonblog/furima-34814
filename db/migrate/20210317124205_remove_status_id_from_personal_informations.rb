class RemoveStatusIdFromPersonalInformations < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_informations, :status_id, :string
  end
end
