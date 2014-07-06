Given(/^seller exists$/) do
  @email = Faker::Internet.email
  @password = "password"
  @seller = Seller.create!(
              :first_name => Faker::Name.first_name,
              :last_name => Faker::Name.last_name,
              :email => @email,
              :password => @password)
end

Given(/^a listing exists$/) do

  Location.create!(:id =>1, :name => "Aldgate")
  @listing = Listing.create!(
    :title => "Listing One",
    :seller_id => @seller.id,
    :location_id => 1,
    :address => "Somewhere",
    :postcode => "12322",
    :description => "Just a listing",
    :price => 3000,
    :avatar => File.open("/Users/serafeim/Desktop/parking.jpg"))
end


Given(/^a buyer exists$/) do
  @email = Faker::Internet.email
  @password = "password"
  @buyer = Buyer.create(
              :first_name => Faker::Name.first_name,
              :last_name => Faker::Name.last_name,
              :email => @email,
              :password => @password)
end

Given(/^the buyer signs in$/) do
  visit root_path
  fill_in("Email", :with => @email )
  fill_in("Password", :with => @password )
  click_button "Sign in"
end

When(/^the buyer clicks on the view listings link$/) do
  click_on "View listings »"
end

When(/^he is on the listings index page$/) do
  visit listings_path
end

Then(/^the page should have listings$/) do
  expect(page).to have_content 'Listing One'
end