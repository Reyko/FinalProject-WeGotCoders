require 'rails_helper'

RSpec.describe Buyer, :type => :model do
  
  it "should have many orders" do
    should have_many(:orders)
  end

end
