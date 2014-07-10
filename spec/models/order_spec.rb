require 'rails_helper'

RSpec.describe Order, :type => :model do

  it "should belong to buyer" do
    should belong_to :buyer
  end

  it "should belong to seller" do
    should belong_to :seller
  end

  it "should belong to listing" do
    should belong_to :listing
  end

  it "should validate address" do
    should validate_presence_of :address
  end

  it "should validate city" do
    should validate_presence_of :city
  end

  it "should validate postcode" do
    should validate_presence_of :postcode
  end

end
