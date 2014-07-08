When(/^the buyer clicks on the Buy Now button$/) do
  click_on "Buy Now"
end

When(/^the buyer is on the new order page$/) do
  visit new_listing_order_path(@listing.id)
end

When(/^the buyer fills his details$/) do
  fill_in("Address", :with => Faker::Address.street_address )
  fill_in("City", :with => Faker::Address.city )
  fill_in("Postcode", :with => Faker::Address.postcode )

end

When(/^the buyer enter's his credit card details$/) do
  fill_in("Credit Card No.", :with => Faker::Business.credit_card_number )
  fill_in("CVC", :with => "231")
  select('May', :from => 'card_month')
  select('2015', :from => 'card_year')
end

When(/^the buyer clicks the complete order button$/) do
  click_on "Complete order"
end

Then(/^a new order should be created$/) do
  Order.all.count.should eq(1)
end

Then(/^the buyer should be redirected to the homepage$/) do
  URI.parse(current_url).path
end