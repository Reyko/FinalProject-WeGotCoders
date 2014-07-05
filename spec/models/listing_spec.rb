require 'rails_helper'

RSpec.describe Listing, :type => :model do
  
  it "should belong to location" do
    should belong_to(:location)
  end
  
  it "should belong to seller" do
    should belong_to(:seller)
  end

  it "should validate for title" do
    should validate_presence_of(:title) 
  end

  it "should validate for location" do
    should validate_presence_of(:location_id) 
  end

  it "should validate for address" do
    should validate_presence_of(:address)
  end

  it "should validate for postcode" do
    should validate_presence_of(:postcode)
  end

  it "should validate for description" do
    should validate_presence_of(:price)
  end

end
