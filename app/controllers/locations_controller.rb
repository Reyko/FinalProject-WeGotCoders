class LocationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @locations = Location.paginate(:page => params[:page])
  end

  def show
    @location = Location.find(params[:id])
  end

end
