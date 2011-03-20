require "selenium-webdriver"

class TreasuryPage

  def initialize browser
    @browser = browser
  end

  def chooseFirstGallery
    @browser.find_element(:xpath, "//div[@class='item-treasury-info-box']/h3/a").click()
  end

  def verifyTreasuryPageResults
    begin
      @browser.find_element(:xpath, "//div[contains(@class,'primary view')]")
    rescue
      raise "Treasury page not loaded with results"
    end

  end
end