class WelcomeController < ApplicationController
  def index
    @placeholder_url = "http://placehold.it/200x200"
    @hero_placeholder_url = "http://placehold.it/300x350"
    @districts = District.order(district_number: :asc)
  end
end
