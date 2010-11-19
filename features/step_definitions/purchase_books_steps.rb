Given /^I am on the shopping page$/ do
  @catalog = CatalogPage.new(@browser)
  @catalog.visit
end

When /^I purchase "([^\"]*)"$/ do |book|
  @shopping_cart = @catalog.add_book_to_shopping_cart(book)
end

When /^I continue shopping$/ do
  @shopping_cart.continue_shopping
end

Then /^I should see "([^\"]*)" in the quantity for line "([^\"]*)"$/ do |quantity, line|
  @shopping_cart.quantity_for_line(line.to_i).should include quantity
end

Then /^I should see "([^\"]*)" in the description for line "([^\"]*)"$/ do |desc, line|
  @shopping_cart.description_for_line(line.to_i).should == desc
end

Then /^I should see "([^\"]*)" in the each for line "([^\"]*)"$/ do |each, line|
  @shopping_cart.each_for_line(line.to_i).should == "$#{each}"
end

Then /^I should see "([^\"]*)" in the total for line "([^\"]*)"$/ do |total, line|
  @shopping_cart.total_for_line(line.to_i).should == "$#{total}"
end

Then /^I should see "([^\"]*)" in the cart total$/ do |total|
  @shopping_cart.cart_total.should == "$#{total}"
end


When /^I checkout$/ do
  @checkout = @shopping_cart.goto_checkout_page
end

When /^I enter "([^\"]*)" in the name field$/ do |name|
  @checkout.name = name
end

When /^I enter "([^\"]*)" in the address field$/ do |address|
  @checkout.address = address
end

When /^I enter "([^\"]*)" in the email field$/ do |email|
  @checkout.email = email
end

When /^I select "([^\"]*)" from the pay type dropdown$/ do |pay_type|
  @checkout.pay_type = pay_type
end

When /^I place my order$/ do
  @checkout.place_order
end

Then /^I should see "([^\"]*)"$/ do |expected_text|
  @catalog.content.should include expected_text
end
