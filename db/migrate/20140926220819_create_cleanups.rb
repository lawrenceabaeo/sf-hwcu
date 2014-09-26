class CreateCleanups < ActiveRecord::Migration
  def change
    create_table :cleanups do |t|
      t.integer :case_id
      t.datetime :case_opened
      t.datetime :case_closed
      t.string :status
      t.string :responsible_agency
      t.string :address
      t.string :category
      t.string :request_type
      t.string :request_details
      t.string :source
      t.integer :supervisor_district
      t.string :neighborhood
      t.datetime :case_updated
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
