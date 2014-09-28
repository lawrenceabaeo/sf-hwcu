class WelcomeController < ApplicationController
  def index
    @placeholder_url = "http://placehold.it/200x200"
    @hero_image = "hwcu-image_600x700.png"
    @districts = District.order(district_number: :asc)
    @resources_url = "#"
  end
end
