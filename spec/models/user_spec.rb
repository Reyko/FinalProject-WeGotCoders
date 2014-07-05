require 'rails_helper'

RSpec.describe User, :type => :model do
    
  it "should validate first name" do
    should validate_presence_of(:first_name)
  end

  it "should validate last name" do
    should validate_presence_of(:last_name)
  end

  it "should validate email" do
    should validate_presence_of(:email)
  end

  it "should validate uniqueness of email" do
    should validate_uniqueness_of(:email)
  end 

  it "should validate presence of type" do
    should validate_presence_of(:type)
  end

end
