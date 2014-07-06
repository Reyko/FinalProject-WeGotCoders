When(/^the buyer clicks on a specific listing$/) do
  click_on "View listing »"
end

Then(/^the buyer should be on the show listing page$/) do
  visit listing_path(@listing.id)
end


Then(/^the buyer should see the specific listing details$/) do
  expect(page).to have_content @listing.title
  expect(page).to have_content @listing.seller.first_name
  expect(page).to have_content @listing.seller.last_name
  expect(page).to have_content @listing.location.name
  expect(page).to have_content @listing.address
  expect(page).to have_content @listing.postcode
  expect(page).to have_content @listing.description
  expect(page).to have_content @listing.price
  expect(page).to have_content @listing.avatar.url
end

