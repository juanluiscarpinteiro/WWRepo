@wwquestion2 @test

Feature: User is able to visit WW site and acces certain elements
	As a user
	I should be able to visit WW site 
    I Should be able to search for "Find a workshop"
    enter a zip to look for 
    view the results data
    click on the first result 
    retrieve the hours of operation


	Scenario: able to get the workshop information for a TODAY's schedule
        When I load the WW home page as a user
        Then I verify I land on the page with title "WW (Weight Watchers): Weight Loss & Wellness Help | WW USA"
        Then I click on "" button
        Then I verify I land on the page with title ""
        Then I enter the zipcode "" on the search box
        Then I retrieve the title and distance and display
        Then I click on the first result of the list
        Then I verify the display list first element matches the clicked element
        Then I display hours of operation for TODAY
        Then I display meetings for "SUN" 