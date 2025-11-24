require 'selenium-webdriver'

base_url = 'https://fireflinkcloudtest.fireflink.com/backend/fireflinkcloud/wd/hub'
params = {
  accessKey: '9c9f28ff-f15e-4539-8b92-1df2faaca0f5',
  licenseId: 'LIC3996',
  projectName: 'Time zone'
}
device_farm_hub_url = 'https://fireflinkcloudtest.fireflink.com/backend/fireflinkcloud/wd/hub?accessKey=9c9f28ff-f15e-4539-8b92-1df2faaca0f5&licenseId=LIC3996&projectName=Time+zone/'
options = Selenium::WebDriver::Chrome::Options.new
options.add_option('platformName', 'Windows 11')
options.add_option('browserVersion', '134')
driver = Selenium::WebDriver.for(:remote, url: device_farm_hub_url, capabilities: options)
driver.manage.window.resize_to(1024, 768)



# Perform search
search_box = driver.find_element(name: 'q')
search_box.send_keys('Selenium Ruby')
search_box.submit

# Wait for results
sleep 3

# Print title
puts driver.title

# Close browser
driver.quit
require 'selenium-webdriver'

# Open Chrome browser
driver = Selenium::WebDriver.for :chrome

# Navigate to Google
driver.navigate.to "https://www.google.com"

# Perform search
search_box = driver.find_element(name: 'q')
search_box.send_keys('Selenium Ruby')
search_box.submit

# Wait for results
sleep 3

# Print title
puts driver.title

# Close browser
driver.quit
