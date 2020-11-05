require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/session'
require 'capybara/dsl'
require 'yaml'
require 'json'
require 'os'

Capybara.default_driver = :selenium
$filePath = ""
usrCur = Dir.pwd

if OS.windows?
    $filePath = usrCur.gsub('/','\\')+"\\features\\support\\"
elsif OS.linux? || OS.mac?
    $filePath = usrCur.gsub('/','/')+"/features/support/"
end

Capybara.register_driver :selenium do |app|
capabilities = {
    :commandTimeout => 500,
    'goog:chromeOptions'=>{
        'args': [ "--start-maximized"]
        }
    }
    Capybara::Selenium::Driver.new(app, 
                    :browser => :chrome,
                    :desired_capabilities => capabilities,
    )
end

# Capybara.javascript_driver = :chrome

Capybara.app_host= "https://www.weightwatchers.com/us/"
