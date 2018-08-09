class HomeController < ApplicationController
  def index
    @demand = params[:demand]
  end
end
