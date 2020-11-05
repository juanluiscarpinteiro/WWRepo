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
    expect(page).to have_title title
end

# Then(/^$/)
# end





