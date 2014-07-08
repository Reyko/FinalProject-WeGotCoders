class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, :only => [:new, :create]

  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
  
    @listing = Listing.find(params[:listing_id])
    @order = Order.new(allowed_params)
    @order.listing_id = @listing.id
    @order.seller_id = @listing.seller_id
    @order.buyer_id = current_user.id

    # Charging credit card
    Stripe.api_key = ENV['STRIPE_API_KEY']

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
    charge = Stripe::Charge.create(
      :amount => (@listing.price * 100).floor, # amount in cents, again
      :currency => "gbp",
      :card => token,
      :description => @listing.title
    )
    rescue Stripe::CardError => e
      flash[:alert => e.message]
    end

    if @order.save
      redirect_to root_path, :notice => "Transaction completed"
    else
      redirect_to new_listing_order_path, :alert => @order.errors.full_messages.to_sentence
    end

  end

  private
  def allowed_params
    params.require(:order).permit(:address,:city,:postcode,:listing_id,:seller_id,:buyer_id)
  end
   #Checking if current user is of type buyer
  def check_user
    if current_user.type != "Buyer"
      redirect_to root_url, :alert => "Please create a buyer account to view this page"
    end
  end
end
