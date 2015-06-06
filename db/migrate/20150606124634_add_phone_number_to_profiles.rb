class AddPhoneNumberToProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :phonr_number, :phone_number
    rename_column :profiles, :descripton, :description
  end
end
#I was going to use add_column and remove_column but then i realized the data would be lost.