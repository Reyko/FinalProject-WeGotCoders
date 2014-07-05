Given(/^a user exists$/) do
  @email = Faker::Internet.email
  @password = "password"
  User.create(
    :first_name => Faker::Name.first_name, 
    :last_name => Faker::Name.last_name,
    :type => "Buyer",
    :email => @email ,
    :password => @password)
end

Given(/^locations exist$/) do
  Location.create(:name => "Aldgate")
  Location.create(:name => "Barbican")
end

Given(/^the user signs in$/) do
  visit root_path
  fill_in("Email", :with => @email )
  fill_in("Password", :with => "password" )
  click_button "Sign in"
end

When(/^the user is on the parking locations page$/) do
  visit locations_path
end

When(/^he clicks on a location$/) do
  click_on "Aldgate"
end

Then(/^the user views the specific location$/) do
  page.has_content? "Aldgate"
end