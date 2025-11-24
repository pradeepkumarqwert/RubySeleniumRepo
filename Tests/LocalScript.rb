require 'selenium-webdriver'

# -------------------------------
# 1. Using Edge locally
# -------------------------------
# Initialize Edge browser
driver = Selenium::WebDriver.for :chrome
driver.manage.window.resize_to(1024, 768)

# Navigate to Google
driver.navigate.to "https://www.google.com"

# Perform search
search_box = driver.find_element(name: 'q')
search_box.send_keys('Selenium Ruby')
search_box.submit

# Wait for results
sleep 3

# Print page title
puts "Edge browser title: #{driver.title}"

# Close Edge
driver.quit

# -------------------------------
# 2. Using Chrome locally
# -------------------------------
# Initialize Chrome browser
driver = Selenium::WebDriver.for :chrome
driver.manage.window.resize_to(1024, 768)

# Navigate to Google
driver.navigate.to "https://www.google.com"

# Perform search
search_box = driver.find_element(name: 'q')
search_box.send_keys('Selenium Ruby')
search_box.submit

# Wait for results
sleep 3

# Print page title
puts "Chrome browser title: #{driver.title}"

# Close Chrome
driver.quit
