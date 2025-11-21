require 'appium_lib'
require 'selenium-webdriver'
require 'fileutils'

# --------------------------
# 1. Desired Capabilities
# --------------------------
caps = {
  deviceName: "Samsung Galaxy A12",
  platformName: "Android",
  platformVersion: "12",
  browserName: "Chrome"
}

opts = {
  server_url: ""
}

driver = Selenium::WebDriver.for(:remote, url: opts[:server_url], desired_capabilities: caps)
wait = Selenium::WebDriver::Wait.new(timeout: 20)

# --------------------------
# 2. Helper: Screenshot
# --------------------------
def take_screenshot(driver, name)
  path = "C:/SimpleRunScreenshots/#{name}.png"
  FileUtils.mkdir_p(File.dirname(path))
  driver.save_screenshot(path)
  puts "Screenshot saved: #{path}"
end

begin
  driver.get("https://www.pantaloons.com/")
  take_screenshot(driver, "01_HomePage")
  sleep 3

  wait.until { driver.find_element(:css, "div.mobilesearchbox").displayed? }.click
  take_screenshot(driver, "02_After_Click_Search_Icon")
  sleep 2

  search_input = wait.until { driver.find_element(:xpath, "//input[@placeholder='Search for products,brands and more...']") }
  search_input.send_keys("Shirt")
  take_screenshot(driver, "03_After_Entering_Search")
  sleep 2

  wait.until { driver.find_element(:xpath, "(//mark[text()='Shirt'])[1]").displayed? }.click
  take_screenshot(driver, "04_After_Search_Result_Click")
  sleep 2

  driver.find_element(:css, "span.cartSpriteIcon").click
  take_screenshot(driver, "05_Cart_Page")

  puts "Page Title: #{driver.title}"

rescue => e
  puts "Exception occurred: #{e}"
  take_screenshot(driver, "99_Exception_Occurred")
ensure
  driver.quit
end
