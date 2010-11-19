Given /^I am on the shopping page$/ do
  @catalog = CatalogPage.new(@browser)
  @catalog.visit
end

When /^I purchase "([^\"]*)"$/ do |book|
  @catalog.purchase_book(book)
  @shopping_cart = ShoppingCartPage.new(@browser)
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
