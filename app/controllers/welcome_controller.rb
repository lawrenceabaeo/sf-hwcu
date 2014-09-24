class WelcomeController < ApplicationController
  def index
    @placeholder_url = "http://placehold.it/200x200"
    @hero_placeholder_url = "http://placehold.it/300x350"
  end
end
