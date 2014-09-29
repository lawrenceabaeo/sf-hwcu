class WelcomeController < ApplicationController
  def index
    @all_districts_image = "San_Francisco_District_ALL_(2012).svg"
    @hero_image = "hazmat-logo-001.png"
    @districts = District.order(district_number: :asc)
    @contact_url = "#Contact"
    @sf_seal_image = "sf_seal.png"
  end
end
