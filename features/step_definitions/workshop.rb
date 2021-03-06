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
    workingHours = page.find(:xpath, config['flatironWorkshopInfo']['flatironHoursForSelectedDay'].sub('DAY',$currentDay),wait:30).text
    puts "Hours of Operation for " +$currentDay
    puts workingHours 
end

Then(/^I display meetings for "([^"]*)" under the "([^"]*)" table$/) do |dayOfTheWeek, workshopTableType|
    printMeetings(dayOfTheWeek,workshopTableType,config)

end


def printMeetings(day,tableCase,config)
    names =  []
    nameToBeAdded = ''
    
    case tableCase.upcase
    when "STUDIO"
        begin
            meetings = page.all(:xpath, config['flatironWorkshopInfo']['tableOfstudioMeetings'].sub('DAY',day), wait:30)
        rescue 
            meetings= '' 
        end
    when 'VIRTUAL'
        begin
            meetings = page.all(:xpath, config['flatironWorkshopInfo']['tableOfVirtualMeetings'].sub('DAY',day), wait:30)
        rescue 
            meetings= '' 
        end

    end
        
        if meetings == ''
            puts "No meetings on this day"
        else 
            for meeting in meetings
                doesItExist =false
                nameToBeAdded = meeting.find(:xpath, ".//span[2]" ).text.strip
                if nameToBeAdded != ''
                    # doesItExist = names.has_key?(nameToBeAdded)
                    names.reverse.each do |key|
                        if key['NAME'] == nameToBeAdded
                            doesItExist = true 
                        end
                    end
                    if doesItExist == false 
                        # puts "I came to does not exist"
                        names << {"NAME" => nameToBeAdded,"AMOUNT" => 1}
                    else 
                        names.reverse.each do |key|
                            if key['NAME'] == nameToBeAdded 
                                # puts key['NAME']
                                # puts key['AMOUNT']
                                key['AMOUNT'] = key['AMOUNT']+1
                            end
                        end
                    end
                end
            end
        end
        # puts names
    case tableCase.upcase
    when 'VIRTUAL'
        puts "Virtual Workshops"
    when 'STUDIO'
        puts "Studio Workshops"
    end
        names.each do |meetings|
            puts meetings['NAME'].to_s + " has " + meetings['AMOUNT'].to_s + " meetings"
        end
end





