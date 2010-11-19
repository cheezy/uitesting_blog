class CatalogPage
  
  BOOK_MAPPING = {
  "Pragmatic Project Automation" => 1,
  "Pragmatic Unit Testing (C#)" => 2,
  "Pragmatic Version Control" => 3
  }

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto 'http://localhost:3000/store'
  end

  def purchase_book(name="Pragmatic Project Automation")
    @browser.button(:value => 'Add to Cart', :index => BOOK_MAPPING[name]).click
  end
end
