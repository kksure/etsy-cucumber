require "selenium-webdriver"

class AdvancedSearchPage

  def initialize browser
    @browser=browser
  end

  def openPage
    @browser.navigate.to "http://www.etsy.com/search_advanced.php"
  end

  def goToSection section
    openPage
    @browser.find_element(:xpath, "//a[@title = '#{section}']").click()
  end

  def search thing
    @browser.find_element(:id, "search-query").send_keys thing
    @browser.find_element(:id, "search_submit").click()
  end

  def subCategory sub_category
    @browser.find_element(:xpath, "//option[text()='#{sub_category}']").click
  end

  def searchFor thing
    field = find_element(:id, "search_query")
    field.sendKeys thing
    field.submit()
  end

  def wait_for_element_present element
    startTime = Date.today
    puts "start time #{startTime}"
    while true
      begin
        @browser.find_element(:xpath, element)
      rescue NoSuchElementError => e
        currentTime = Date.today
        span = currentTime - startTime
        puts "current time #{currentTime}"
        puts "span #{span}"

        if span >= 5000
          raise "Could not open file"
        else
          sleep 500
        end
      end
    end
  end
end