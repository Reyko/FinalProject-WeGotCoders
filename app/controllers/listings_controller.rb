class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, :only => :index, :only => :show

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(allowed_params)
    @listing.seller_id = current_user.id

    if @listing.save
      flash[:notice] = "Record Saved"
      respond_to do |format|
        format.html { redirect_to sellers_path, :notice => "Record Saved"}
        format.js {render text: "Object successfully destroyed", status: :created }
      end
    else
      redirect_to sellers_path
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
