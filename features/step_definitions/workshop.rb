require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'selenium/webdriver'
require 'capybara/rspec'
require 'yaml'

config = YAML.load_file("#{$filePath}object-repository.yaml")

When(/^I load the WW home page as a user$/)do 
    visit("https://www.weightwatchers.com/us/")
    sleep(3)
end

Then(/^I verify I land on the page with title "([^"]*)"$/) do |title|
    puts "Title of page is " + page.title    
    expect(page).to have_title title
end

Then(/^I click on "([^"]*)" button$/) do |button|
    page.find(:xpath, config['homePage']['findAWorkshop'].sub('ACTION',button),wait:30).click
    sleep(5)
end

Then(/^I enter the zipcode "([^"]*)" on the search box$/) do |zipcode|
    page.find(:xpath, config['workshopPage']['searchboxLocation'],wait:30).click
    page.find(:xpath, config['workshopPage']['searchboxLocation'],wait:30).send_keys(zipcode)
    sleep(5)

end

Then(/^I click on the arrow to search$/) do
    page.find(:xpath, config['workshopPage']['searchBoxSendArrow'],wait:30).click
    sleep(3)
end

Then(/^I retrieve the title and distance for first record and display$/) do
    $firstRecordUIObject =page.find(:xpath, config['workshopPage']['resultsFirstElement'],match: :first,wait:30)
    $firstRecordName =  page.find(:xpath, config['workshopPage']['resultsFirstElement'],match: :first,wait:30).text
    $firstRecordDistance = page.find(:xpath, config['workshopPage']['resultsFirstElementDistance'],match: :first,wait:30).text
    puts "First record info " + $firstRecordName.to_s + "  " + $firstRecordDistance.to_s 
    sleep(3)
end

Then(/^I click on the first result of the list$/) do
    $firstRecordUIObject.click
end

Then(/^I verify the display list first element matches the clicked element$/) do
    $clickedLocationTitle = page.find(:xpath, config['flatironWorkshopInfo']['flatironHeaderName'],wait:30).text
    puts "First element on list for prior page was " + $firstRecordName 
    puts "This is the elemt showing on current page " + $clickedLocationTitle
    expect($firstRecordName).to eq($clickedLocationTitle)
end

Then(/^I display hours of operation for TODAY$/) do
    time = Time.new
    page.find(:xpath, config['flatironWorkshopInfo']['flatironToggleHours'],wait:30).click
    puts "Today is " + time.strftime("%A")
    $currentDay = time.strftime("%A")
    begginingHours = page.find(:xpath, config['flatironWorkshopInfo']['flatironBegginingHoursForSelectedDay'].sub('DAY',$currentDay),wait:30).text
    endingHours = page.find(:xpath, config['flatironWorkshopInfo']['flatironendingHoursForSelectedDay'].sub('DAY',$currentDay),wait:30).text
    puts "Hours of Operation for " +$currentDay
    puts begginingHours 
    puts endingHours
end
Then(/^$/) do 

end
Then(/^$/) do
end







