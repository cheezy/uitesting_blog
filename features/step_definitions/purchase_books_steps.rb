
Transform /^line (\d+)$/ do |line_string|
  line_string.to_i
end

Transform /^(\d+\.\d{2})$/ do |dollar_amount|
  "$#{dollar_amount}"
end

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

Then /^I should see "([^\"]*)" in the quantity for (line \d+)$/ do |quantity, line|
  @shopping_cart.quantity_for_line(line).should include quantity
end

Then /^I should see "([^\"]*)" in the description for (line \d+)$/ do |desc, line|
  @shopping_cart.description_for_line(line).should == desc
end

Then /^I should see "([^\"]*)" in the each for (line \d+)$/ do |each, line|
  @shopping_cart.each_for_line(line).should == each
end

Then /^I should see "([^\"]*)" in the total for (line \d+)$/ do |total, line|
  @shopping_cart.total_for_line(line).should == total
end

Then /^I should see "([^\"]*)" in the cart total$/ do |total|
  @shopping_cart.cart_total.should == total
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

And /^I checkout with$/ do |table|
  @checkout_page = @shopping_cart.goto_checkout_page
  @checkout_page.complete_order(table.hashes.first)
end

When /^I purchase a book$/ do
  @shopping_cart = @catalog.add_book_to_shopping_cart('Pragmatic Version Control')
end

And /^I complete the order$/ do
  @checkout_page = @shopping_cart.goto_checkout_page
  @checkout_page.complete_order
end
