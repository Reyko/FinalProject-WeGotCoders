class SellersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  def index
    @listing = Listing.new
    @seller = current_user
  end
  
  #Checking if current user is of type seller
  private
  def check_user
    if current_user.type != "Seller"
      redirect_to root_url, :alert => "Please create a seller's account to view this page"
    end
  end
end
