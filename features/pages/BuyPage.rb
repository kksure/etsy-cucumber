require "selenium-webdriver"

class BuyPage

  def initialize browser
    @browser=browser
  end

  def selectTreasury
    @browser.find_element(:id, "treasury-panel-button").click()
  end

  def goToBuySection
    @browser.find_element(:xpath, "//ul[@id='user-nav']/li/a[text()='Buy']").click()
  end

end