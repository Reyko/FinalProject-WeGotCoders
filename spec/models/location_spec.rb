require 'rails_helper'

RSpec.describe Location, :type => :model do
  
  before do
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.add_stub(
      "New York, NY", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'address'      => 'New York, NY, USA',
          'state'        => 'New York',
          'state_code'   => 'NY',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )

     @location = Location.create(:name => "New York, NY")
  end

  it "should have a name" do
    expect(@location.name).to eq("New York, NY")
  end

  it "should have longitude and latitude" do
    expect(@location.latitude).to eq(40.7143528)
    expect(@location.longitude).to eq(-74.0059731)
  end

end
