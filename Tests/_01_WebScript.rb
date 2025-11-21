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
