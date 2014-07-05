require 'rails_helper'

RSpec.describe Seller, :type => :model do
  
  it "should have many listings" do
    should have_many(:listings).dependent(:destroy) 
  end

end
