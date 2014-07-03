
class LocationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @locations = Location.paginate(:page => params[:page])
    @locations.sort_by{|location| location.name.downcase}
  end

  def show
    @location = Location.find(params[:id])
    @client = GooglePlaces::Client.new("AIzaSyB0B0X06CrlKX4Dr0RrKCnjBIlD6Tpi8xs")
    @parkings = @client.spots(@location.latitude, @location.longitude, :types => 'parking',
     :radius => 2000,:exclude => ['cafe','restaurant','lodging','food'])
  end

end
