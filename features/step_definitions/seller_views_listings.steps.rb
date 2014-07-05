Given(/^the seller has listings$/) do

  @seller.listings.create!(
    :title => "Superb Garage",
    :location_id => 1,
    :address => "24 Harbour Ridge",
    :postcode => "GU2 7JN",
    :description => "A lovely parking space",
    :price => 10000,
    :avatar => File.open("/Users/serafeim/Desktop/parking.jpg"))

end

Then(/^the seller should see them in his profile page$/) do
     save_and_open_page
   page.should have_css('.listing')

end