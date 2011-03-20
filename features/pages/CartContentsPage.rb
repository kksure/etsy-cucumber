require "selenium-webdriver"

class CartContentsPage

  def initialize browser
    @browser=browser
  end

  def hasItem
    @browser.navigate.to "http://www.etsy.com/cartcheckout.php"
    begin
      @browser.find_element(:xpath, "//div[@id='checkout-header']/h1[contains(text(),'1 item in your cart')]")
    rescue
      raise "Item not added to cart"      
    end
  end

  def removeItem
    @browser.navigate.to "http://www.etsy.com/cartcheckout.php"
    @browser.find_element(:xpath, "//a[@rel = 'remove']").click()
  end

  def verifyCartIsEmpty
    @browser.navigate.to "http://www.etsy.com/cartcheckout.php"
#    begin
      @browser.find_element(:xpath, "//div[@id='empty-cart']")
#    rescue
#      raise "Cart is not empty"
#    end
    HomePage.new(@browser).openHomePage
  end

end