module WatirHelper
  # A helper class to make accessing web elements via Watir easier.
  # All methods take an identifier parameter.  This parameter is
  # an array of hashes that are used to identify an element on the
  # page.  On elements that support multiple attributes you can
  # provide multiple identifiers.
  #
  # This module assumes there is a @browser variable available.

  def self.included(cls)
    cls.extend ClassMethods
  end

  module ClassMethods
    # adds three methods - one to put data in a text field, another
    # to fetch that data, and another to return the actual text_field.
    #
    # Example:  text_field(:first_name, {:id => "first_name})
    # will generate the 'first_name', 'first_name=', and
    # 'first_text_field' methods
    def text_field(name, identifier)
      define_method(name) do
        @browser.text_field(identifier).value
      end
      define_method("#{name}=") do |value|
        @browser.text_field(identifier).set(value)
      end
      define_method("#{name}_text_field") do
        @browser.text_field(identifier)
      end
    end

    # adds three methods - one to put data in a hidden field, another
    # to fetch that data, and a third to return the hidden field.
    #
    # Example:  hidden(:first_name, {:id => "first_name})
    # will generate the 'first_name', 'first_name=' and
    # 'first_hidden' methods
    def hidden(name, identifier)
      define_method(name) do
        @browser.hidden(identifier).value
      end
      define_method("#{name}=") do |value|
        @browser.hidden(identifier).set(value)
      end
      define_method("#{name}_hidden") do
        @browser.hidden(identifier)
      end
    end

    # adds three methods - one to select an item in a drop-down,
    # another to fetch the currently selected item, and another
    # to return the select_list.
    #
    # Example:  select_list(:state, {:id => "state"})
    # will generate the 'state', 'state=' and 'state_select_list'
    # methods
    def select_list(name, identifier)
      define_method(name) do
        @browser.select_list(identifier).value
      end
      define_method("#{name}=") do |value|
        @browser.select_list(identifier).set(value)
      end
      define_method("#{name}_select_list") do
        @browser.select_list(identifier)
      end
    end

    # adds three methods - one to check, one to uncheck and
    # a third to return a checkbox
    #
    # Example: checkbox(:active, {:name => "is_active"})
    # will generate the 'check_active', 'uncheck_active', and
    # 'active_checkbox' methods
    def checkbox(name, identifier)
      define_method("check_#{name}") do
        @browser.checkbox(identifier).set
      end
      define_method("uncheck_#{name}") do
        @browser.checkbox(identifier).clear
      end
      define_method("#{name}_checkbox") do
        @browser.checkbox(identifier)
      end
    end

    # adds three methods - one to select, another to clear and
    # another to return a radio button
    #
    # Example:  radio_button(:north, {:id => "north"})
    # will generate 'select_north', 'clear_north', and
    # 'north_radio_button' methods
    def radio_button(name, identifier)
      define_method("select_#{name}") do
        @browser.radio(identifier).set
      end
      define_method("clear_#{name}") do
        @browser.radio(identifier).clear
      end
      define_method("#{name}_radio_button")  do
        @browser.radio(identifier)
      end
    end

    # adds three methods - one click a button, another
    # to click a button without waiting for the action to
    # complete, and a third to return the button.
    #
    # Example:  button(:save, {:value => "save"})
    # will generate the 'save', 'save_no_wait', and
    # 'save_button' methods
    def button(name, identifier)
      define_method(name) do
        @browser.button(identifier).click
      end
      define_method("#{name}_no_wait") do
        @browser.button(identifier).click_no_wait
      end
      define_method("#{name}_button") do
        @browser.button(identifier)
      end
    end

    # adds three methods - one to select a link, another
    # to select a link and not wait for the corresponding
    # action to complete, and a third to return the link.
    #
    # Example:  link(:add_to_cart, {:text => "Add to Cart"})
    # will generate the 'add_to_cart', 'add_to_cart_no_wait',
    # and 'add_to_cart_link' methods
    def link(name, identifier)
      define_method(name) do
        @browser.link(identifier).click
      end
      define_method("#{name}_no_wait") do
        @browser.link(identifier).click_no_wait
      end
      define_method("#{name}_link") do
        @browser.link(identifier)
      end
    end

    # adds a method that returns a table element
    #
    # Example:  table(:shopping_cart, {:index => 1})
    # will generate a 'shopping_cart' method
    def table(name, identifier)
      define_method(name) do
        @browser.table(identifier)
      end
    end

    # adds two methods - one to return the text within
    # a row and one to return a table row element
    #
    # Example: row(:header, {:id => :header}) will
    # generate a 'header' and 'header_row' method
    def row(name, identifier)
      define_method(name) do
        @browser.row(identifier).text
      end
      define_method("#{name}_row") do
        @browser.row(identifier)
      end
    end

    # adds a method to return the text of a table data <td> element
    # and another one to return the cell object
    #
    # Example:  cell(:total, {:id => "total"})
    # will generate a 'total' method and a 'total_cell'
    # method
    def cell(name, identifier)
      define_method(name) do
        @browser.cell(identifier).text
      end
      define_method("#{name}_cell") do
        @browser.cell(identifier)
      end
    end

    # adds a method that returns the content of a <div>
    # and another method that returns the div element
    #
    # Example: div(:header, {:id => "banner"})
    # will generate a 'header' and 'header_div' methods
    def div(name, identifier)
      define_method(name) do
        @browser.div(identifier).text
      end
      define_method("#{name}_div") do
        @browser.div(identifier)
      end
    end

    # adds a method that returns the content of a <dd>
    # and another method that returns the dd element
    def dd(name, identifier)
      define_method(name) do
        @browser.dd(identifier).text
      end
      define_method("#{name}_dd") do
        @browser.dd(identifier)
      end
    end

    # adds a method that returns the content of a <dl>
    # and another that returns the dl element
    def dl(name, identifier)
      define_method(name) do
        @browser.dl(identifier).text
      end
      define_method("#{name}_dl") do
        @browser.dl(identifier)
      end
    end

    # adds a method that returns the content of a <dt>
    # and another that returns the dt element
    def dt(name, identifier)
      define_method(name) do
        @browser.dt(identifier).text
      end
      define_method("#{name}_dt") do
        @browser.dt(identifier)
      end
    end

    # adds a method that returns the content of a
    # <form> element and another that returns the
    # form element
    def form(name, identifier)
      define_method(name) do
        @browser.form(identifier).text
      end
      define_method("#{name}_form") do
        @browser.form(identifier)
      end
    end

    # adds a method that returns a the content of a
    # <frame> element and another that returns the
    # frame element
    def frame(name, identifier)
      define_method(name) do
        @browser.frame(identifier).text
      end
      define_method("#{name}_frame")  do
        @browser.frame(identifier)
      end
    end

    # adds a method that returns an image <image> element
    def image(name, identifier)
      define_method(name) do
        @browser.image(identifier)
      end
    end
  end

  def content
    @browser.text
  end

  def visit_page(page_url)
    @browser.goto(page_url)
  end

  def page_title
    @browser.title
  end

  def wait_for_page
    @browser.wait
  end
end
