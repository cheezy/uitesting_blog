class CatalogPage
  include WatirHelper
  
  BOOK_MAPPING = {
  "Pragmatic Project Automation" => 1,
  "Pragmatic Unit Testing (C#)" => 2,
  "Pragmatic Version Control" => 3
  }

  def initialize(browser)
    @browser = browser
  end

  def visit
    visit_page 'http://localhost:3000/store'
  end

  def add_book_to_shopping_cart(name="Pragmatic Project Automation")
    @browser.button(:value => 'Add to Cart', :index => BOOK_MAPPING[name]).click
    ShoppingCartPage.new(@browser)
  end
end
