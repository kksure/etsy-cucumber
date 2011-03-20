require "selenium-webdriver"

class SearchResultsPage

  def initialize browser
    @browser=browser
  end

  def verifySearchResultsPresent
    begin
      @browser.find_element(:xpath, "//div[@id='search-header']/h1[@class='summary' and contains(text(), 'results for')]")
    rescue
      raise "No search results found"
    end
  end

  def buyFirstItem
    @browser.find_element(:xpath, "//div[@id='primary']//img").click
    @browser.find_element(:xpath, "//span/input[@value='Add to Cart']").click
  end
end