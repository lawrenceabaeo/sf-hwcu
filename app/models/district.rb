class District < ActiveRecord::Base
  validates :district_number, uniqueness: true
end
