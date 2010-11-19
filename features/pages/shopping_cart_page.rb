class ShoppingCartPage

  QUANTITY_COLUMN = 1
  DESCRIPTION_COLUMN = 2
  EACH_COLUMN = 3
  TOTAL_COLUMN = 4
  HEADER_OFFSET = 2

  def initialize(browser)
    @browser = browser
  end
  
  def goto_checkout_page
    @browser.link(:text => 'Checkout').click
    CheckoutPage.new(@browser)
  end
  
  def continue_shopping
    @browser.link(:text => 'Continue shopping').click
  end

  def cart_total
    @browser.cell(:class => 'total-cell').text
  end

  def quantity_for_line(line_number)
    cart_data_for_line(line_number)[QUANTITY_COLUMN].text
  end

  def description_for_line(line_number)
    cart_data_for_line(line_number)[DESCRIPTION_COLUMN].text
  end
  
  def each_for_line(line_number)
    cart_data_for_line(line_number)[EACH_COLUMN].text
  end

  def total_for_line(line_number)
    cart_data_for_line(line_number)[TOTAL_COLUMN].text
  end

  private

  def cart_data_for_line(line)
    @browser.table(:index => 1)[HEADER_OFFSET+line]
  end
  
end
