class WelcomeController < ApplicationController
  def index 
    p "******"
    render json: {name: "grace"}
  end
end
