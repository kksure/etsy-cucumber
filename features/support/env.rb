  require "selenium-webdriver"

#  browser = Selenium::WebDriver
  browser = Selenium::WebDriver.for(:firefox)

  Before do
    @browser = browser    
    @browser.manage.delete_cookie "cart"
    @browser.manage.delete_all_cookies
  end
