class District < ActiveRecord::Base
  validates :district_number, uniqueness: true
  has_one :supervisor, :foreign_key => "district"
end
