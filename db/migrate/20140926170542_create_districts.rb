class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :district_number

      t.timestamps
    end
  end
end
