Given(/^a seller exists$/) do
  @email = Faker::Internet.email
  @password = "password"
  @seller = Seller.create(
              :first_name => Faker::Name.first_name,
              :last_name => Faker::Name.last_name,
              :email => @email,
              :password => @password)

end

Given(/^the seller has logged in$/) do
  visit root_path
  fill_in("Email", :with => @email )
  fill_in("Password", :with => @password )
  click_button "Sign in"
end

Given(/^the seller is on his profile page$/) do
  visit sellers_path
end

When(/^the seller fills the details in the new listing form$/) do
  fill_in("Title", :with => Faker::Name.title)
  select('Barbican', :from => 'listing_location_id')
  fill_in("Address", :with => Faker::Address.street_address)
  fill_in("Postcode", :with => Faker::Address.postcode)
  fill_in("Description", :with => Faker::Lorem.paragraph)
  attach_file('Image', "/Users/serafeim/Desktop/parking.jpg")
  fill_in("Price", :with => Faker::Number.number(10))
end

When(/^the seller clicks the add new listing button$/) do
  click_button "Add new"
end

Then(/^a new listing should be created$/) do
  Listing.all.count.should eq(1)
end

Then(/^the listing should belong to the seller$/) do
  Listing.find_by(:seller_id => @seller.id).should be_valid
end