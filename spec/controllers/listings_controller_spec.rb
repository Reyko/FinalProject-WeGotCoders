require 'rails_helper'

RSpec.describe ListingsController, :type => :controller do

  describe "POST to create" do
    context "with valid data" do
     

      before do
        @seller = Seller.create!(
                      :first_name => "John",
                      :last_name => "Damon",
                      :email => "test@email.com",
                      :password => "password")

        sign_in :user, @seller  

        @title = "A lovely listing"
        @location_id = 1
        @address = "Just another address"
        @postcode = "GU2 7JN"
        @description = "A listing description"
        @avatar = Rack::Test::UploadedFile.new("/Users/serafeim/Desktop/parking.jpg", "image/jpeg")
        @price = 10000
 
        params = {
          :listing => {
            :title => @title,
            :location_id => @location_id,
            :address => @address,
            :price => @price,
            :postcode => @postcode,
            :description => @description,
            :avatar => @avatar
          }
        }
        
        post :create, params
      end
    
      it "should create a Listing" do
        expect(Listing.count).to eq(1)
      end

      it "should set an instance variable @listing" do
        expect(assigns(:listing).title).to eq(@title)
      end

      it "should be redirected to the seller index page" do
        expect(response).to redirect_to(sellers_path)
      end

      it "should set a flash notice" do
        expect(flash[:notice]).to match(/Record Saved/)
      end
    end

    context "without valid data" do
      before do 
        params = {
          :listing => {
            :title => ""
          }
        }

        post :create, params
      end

      it "should create a Listing" do
        expect(Listing.count).to eq(0)
      end

      it "should be redirected to the show page" do
        expect(response).to redirect_to(sellers_path)
      end
    end

  end
end
