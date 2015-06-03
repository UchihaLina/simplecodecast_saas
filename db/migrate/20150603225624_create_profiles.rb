class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :phonr_number
      t.string :contact_email
      t.text :descripton
      
      t.timestamps
    end
  end
end
