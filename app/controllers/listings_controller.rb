class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, :only => :index

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    if current_user.id != @listing.seller.id && current_user.type != "Buyer"
      redirect_to root_url, :alert => "Please create a buyer account to view this page"
    end
  end

  def create
    @listing = Listing.new(allowed_params)
    @listing.seller_id = current_user.id

    if @listing.save
      redirect_to sellers_path, :notice => "Record Saved"
    else
      redirect_to sellers_path, :alert => @listing.errors.full_messages.to_sentence
    end  
  end

  private
  def allowed_params
    params.require(:listing).permit(:title,:description,:address,:postcode,:price,:location_id,:seller_id,:avatar)
  end
  #Checking if current user is of type buyer
  def check_user
    if current_user.type != "Buyer" 
      redirect_to root_url, :alert => "Please create a buyer account to view this page"
    end
  end
end
