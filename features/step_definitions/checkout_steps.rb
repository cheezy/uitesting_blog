
Given /^I am on the depot site$/ do
  @catalog = CatalogPage.new(@browser)
  @catalog.visit
end

When /^I complete the order with:$/ do |table|
  @checkout_page = @shopping_cart.goto_checkout_page
  @checkout_page.complete_order(table.hashes.first)
end

When /^I complete the order leaving the "([^\"]*)" field blank$/ do |field|
  @checkout_page = @shopping_cart.goto_checkout_page
  @checkout_page.complete_order(field.downcase => "")
end

Then /^I should see an error message with "([^\"]*)"$/ do |message|
  @checkout_page.content.should include message
end

When /^go to the checkout page$/ do
  @checkout_page = @shopping_cart.goto_checkout_page
end

Then /^the Pay with dropdown should contain "([^\"]*)"$/ do |value|
  @checkout_page.pay_type_select_list.options.should include value
end
