require 'appium_lib'
require 'selenium-webdriver'
require 'fileutils'

caps = {
  deviceName: "Vivo V40 Pro",
  platformName: "Android",
  platformVersion: "14",
  app: "General-Store-final (1).apk"
}

opts = {
  server_url: ""
}

driver = Selenium::WebDriver.for(:remote, url: opts[:server_url], desired_capabilities: caps)
wait = Selenium::WebDriver::Wait.new(timeout: 20)

def take_screenshot(driver, name)
  path = "C:/SimpleRunScreenshots/#{name}.png"
  FileUtils.mkdir_p(File.dirname(path))
  driver.save_screenshot(path)
  puts "Screenshot saved: #{path}"
end

begin
  # Select country
  country_dropdown = wait.until { driver.find_element(:xpath, "//android.widget.Spinner[@resource-id='com.androidsample.generalstore:id/spinnerCountry']") }
  country_dropdown.click
  take_screenshot(driver, "01_CountryDropdown_Click")
  sleep 1

  country_option = driver.find_element(:xpath, "//android.widget.TextView[@resource-id='android:id/text1' and @text='Afghanistan']")
  country_option.click
  take_screenshot(driver, "02_Country_Selected")

  name_field = driver.find_element(:xpath, "//android.widget.EditText[@resource-id='com.androidsample.generalstore:id/nameField']")
  name_field.send_keys("Tester1")
  take_screenshot(driver, "03_Name_Entered")
  driver.hide_keyboard

  driver.find_element(:xpath, "//android.widget.RadioButton[@resource-id='com.androidsample.generalstore:id/radioMale']").click
  take_screenshot(driver, "04_Gender_Selected")

  driver.find_element(:xpath, "//android.widget.Button[@resource-id='com.androidsample.generalstore:id/btnLetsShop']").click
  take_screenshot(driver, "05_LetsShop_Clicked")
  sleep 2

  driver.find_element(:xpath, "//android.widget.TextView[@text='Air Jordan 4 Retro']/following-sibling::android.widget.LinearLayout//android.widget.TextView[@resource-id='com.androidsample.generalstore:id/productAddCart']").click
  take_screenshot(driver, "06_Product_Added")
  sleep 1

  driver.find_element(:xpath, "//android.widget.ImageButton[@resource-id='com.androidsample.generalstore:id/appbar_btn_cart']").click
  take_screenshot(driver, "07_Cart_Page")

  puts "Test execution completed successfully."

rescue => e
  puts "Exception occurred: #{e}"
  take_screenshot(driver, "99_Exception")
ensure
  driver.quit
end
