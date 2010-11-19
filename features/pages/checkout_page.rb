
class CheckoutPage
  
  def initialize(browser)
    @browser = browser
  end

  def name=(name)
    @browser.text_field(:id => 'order_name').set(name)
  end

  def address=(address)
    @browser.text_field(:id => 'order_address').set(address)
  end

  def email=(email)
    @browser.text_field(:id => 'order_email').set(email)
  end

  def pay_type=(pay_type)
    @browser.select_list(:id => 'order_pay_type').set(pay_type)
  end

  def place_order
    @browser.button(:value => 'Place Order').click
  end
  
end
