require "selenium-webdriver"

device_farm_hub_url = "http://103.182.210.85:4444"



# Build capabilities using Selenium::WebDriver::Remote::Capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new(
  browser_name: "chrome",
  browser_version: "131",
  platform_name: "Windows 11",
  "goog:chromeOptions" => {
    args: ["--disable-gpu", "--no-sandbox"]
  }
)

# Start remote driver using ONLY capabilities
driver = Selenium::WebDriver.for(
  :remote,
  url: device_farm_hub_url,
  capabilities: caps
)

driver.manage.window.resize_to(1024, 768)
puts "Session started successfully!"

# SCRIPT EXECUTION
driver.navigate.to "https://www.google.com"

search_box = driver.find_element(name: "q")
search_box.send_keys("Selenium Ruby")
search_box.submit

sleep 3
puts "Remote Chrome browser title: #{driver.title}"

driver.quit
