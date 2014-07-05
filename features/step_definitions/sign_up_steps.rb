Given(/^that the user is on the registration page$/) do
 visit new_user_registration_path
end

When(/^the user enters his details$/) do
  within all('.registration').last do
    fill_in("First name", :with => Faker::Name.first_name)
    fill_in("Last name", :with => Faker::Name.last_name)
    fill_in("Email", :with => Faker::Internet.email )
    fill_in("Password", :with => "password")
    fill_in("Password confirmation", :with => "password")
  end
end

When(/^the user selects a type of account$/) do
  select "Seller", :from => "Type"
end

When(/^the user clicks the submit button$/) do
  click_on "Sign up"
end

Then(/^a new account should be created$/) do
  Seller.all.count.should eq(1)
end