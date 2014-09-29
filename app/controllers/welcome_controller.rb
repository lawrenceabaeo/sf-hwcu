class WelcomeController < ApplicationController
  def index
    @all_districts_image = "San_Francisco_District_ALL_(2012).svg"
    @hero_image = "hwcu-image_600x700.png"
    @districts = District.order(district_number: :asc)
    @resources_url = "#"
  end
end
