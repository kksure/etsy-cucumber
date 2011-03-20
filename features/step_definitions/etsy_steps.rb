require "selenium-webdriver"

Given /^I am on Etsy.com$/ do
  HomePage.new(@browser).openHomePage
end

Given /^I am searching on Etsy.com$/ do
  AdvancedSearchPage.new(@browser).openPage
end

When /^I specify the (.*) sub category$/ do |sub_cat|
  AdvancedSearchPage.new(@browser).subCategory sub_cat
end

When /^I search for (.*)$/ do |thing|
  AdvancedSearchPage.new(@browser).search thing
end

Then /^there are search results$/ do
  SearchResultsPage.new(@browser).verifySearchResultsPresent
end

When /^I want to browse through a treasury gallery$/ do
  When "I want to buy something from etsy.com"
  When "I want to browse the treasury"
  When "I choose the first treasury gallery"
end

When /^I want to buy something from etsy.com$/ do
   BuyPage.new(@browser).goToBuySection
end

When /^I want to browse the treasury$/ do
    BuyPage.new(@browser).selectTreasury
end

When /^I choose the first treasury gallery$/ do
    TreasuryPage.new(@browser).chooseFirstGallery
end

Then /^results will be displayed in the gallery$/ do
   TreasuryPage.new(@browser).verifyTreasuryPageResults
end

Given /^that the cart is empty$/ do
  HomePage.new(@browser).openHomePage
  CartContentsPage.new(@browser).verifyCartIsEmpty
end

When /^an item is added to the cart$/ do
  AdvancedSearchPage.new(@browser).search "hat"
  SearchResultsPage.new(@browser).buyFirstItem
end

Then /^the cart contains that item$/ do
  CartContentsPage.new(@browser).hasItem

end

Given /^the cart contains one item$/ do
  Given "I am searching on Etsy.com"
  When "an item is added to the cart"
end

When /^the item is removed$/ do
  CartContentsPage.new(@browser).removeItem()
end

Then /^the cart will be empty$/ do
   CartContentsPage.new(@browser).verifyCartIsEmpty
end
