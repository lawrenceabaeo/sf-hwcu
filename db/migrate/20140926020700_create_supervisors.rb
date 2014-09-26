class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.integer :district
      t.string :name
      t.string :phone_number
      t.string :facebook_url
      t.string :email
      t.string :website_url
      t.string :twitter
      t.string :address

      t.timestamps
    end
  end
end
