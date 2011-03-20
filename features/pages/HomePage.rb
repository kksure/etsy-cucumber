require "selenium-webdriver"

class HomePage

  def initialize browser
    @browser=browser
  end

  def openHomePage
    @browser.navigate.to "http://etsy.com"
  end

  def cartSize
    @browser.find_element(:xpath, "//div[@id='cart']/a/div[2]").text
  end

  
end