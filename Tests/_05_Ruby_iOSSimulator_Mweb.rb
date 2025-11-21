require 'appium_lib'
require 'selenium-webdriver'
require 'fileutils'

caps = {
  deviceName: "iPhone 14",
  platformName: "iOS",
  platformVersion: "18.5",
  browserName: "Safari"
}

opts = {
  server_url: ""
}

driver = Selenium::WebDriver.for(:remote, url: opts[:server_url], desired_capabilities: caps)
wait = Selenium::WebDriver::Wait.new(timeout: 15)

def take_screenshot(driver, name)
  path = "C:/SimpleRunScreenshots/#{name}.png"
  FileUtils.mkdir_p(File.dirname(path))
  driver.save_screenshot(path)
  puts "Screenshot saved: #{path}"
end

begin
  driver.get("https://www.wikipedia.org/")
  sleep 2

  search_input = wait.until { driver.find_element(:id, "searchInput") }
  search_input.send_keys("iPhone")
  sleep 2

  driver.find_element(:css, "button[type='submit']").click
  sleep 2
  wait.until { driver.find_element(:xpath, "//h1").displayed? }

  puts "Title after search: #{driver.title}"

  driver.execute_script("window.scrollBy(0, 500)")
  sleep 1
  driver.execute_script("window.scrollBy(0, 500)")
  sleep 1

  link = wait.until { driver.find_element(:xpath, "(//a[contains(@href,'Apple')])[1]") }
  link.click
  sleep 2

  heading = wait.until { driver.find_element(:tag_name, "h1") }
  puts "Opened page: #{heading.text}"

  driver.back
  sleep 2
  puts "Now on: #{driver.current_url}"

  driver.refresh
  sleep 2

rescue => e
  puts "Exception occurred: #{e}"
  take_screenshot(driver, "99_Exception_Occurred")
ensure
  driver.quit
end
