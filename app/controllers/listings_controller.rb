class ListingsController < ApplicationController

  def create
    @listing = Listing.new(allowed_params)
    @listing.seller_id = current_user.id

    if @listing.save
      flash[:notice] = "Record Saved"
      respond_to do |format|
        format.html { redirect_to sellers_path, :notice => "Record Saved"}
        format.js
      end
    else
      redirect_to_sellers_path
    end  
  end

  private
  def allowed_params
    params.require(:listing).permit(:title,:location_id,:seller_id,:description,:address,:postcode,:description,:price)
  end
end
