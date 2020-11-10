# WWRepo
This is a repo for the requested questions

### Instructions

1. Global Dependencies
    * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
    * Or Install Ruby with [Homebrew](http://brew.sh/)
    ```
    $ brew install ruby
    ```
    * Install bundler (Sudo may be necessary)
    ```
    $ gem install bundler
    ```

2. Download latest stable drivers and add them to your system path:
	* ChromeDriver (https://chromedriver.chromium.org/)
	* to enable safari driver - open safari preferences - advanceded - go to developer tab - click the allow remote automation option
	
	Move drivers to a folder and add to PATH variable
	
	$ export PATH=$PATH:/Users/Username/drivers/
	
	If you are using MacOS be sure that chrome is installed and visible under your applications
	
	
4. Project Dependencies
	* Install packages (Use sudo if necessary)
	```
	$ sudo bundle install
	$ sudo bundle update
	```

5. In the features folder there are feature files 

6. Run the cucumber tests from the base of the test folder 
	```
	cucumber features -t @wwquestion2 etc



Question #1
I used a Gem to process the data and diaplay in the requested format.
To run script follow the following

On command line or git bash go to the location where the repo was cloned and enter the following
ruby question1.rb


Questiion #2 
I decided to approach the automation with a BDD mindset. I was able to store all UI elements under the object-repository.yaml and run in chrome.


Question #3 
to run on command line or git bash go to the location where the repo was cloned and enter the following
ruby question3.rb
