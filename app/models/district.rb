class District < ActiveRecord::Base
  validates :district_number, uniqueness: true
  has_one :supervisor, :foreign_key => "district"
  has_many :cleanups, :foreign_key => "supervisor_district"
end
