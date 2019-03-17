require "selenium-webdriver"
require "capybara"
require "capybara/dsl"


def use_selenium_session(user_data_dir = nil, headless = false)
    
  
    Capybara.register_driver :selenium_chrome do |app|
      user_data_dir ||= "#{__dir__}/.chrome_data"
      user_profile_switch = "--user-data-dir=#{user_data_dir}"
      headless_switch = "--headless"
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument(user_profile_switch)
      if headless
        options.add_argument(headless_switch)
        options.add_argument("--disable-gpu")
      end
  
      Capybara::Selenium::Driver.new(app,
                                     browser: :chrome,
                                     options: options)
    end
    Capybara.default_max_wait_time = 10
    Capybara.default_driver = :selenium_chrome
    Capybara.current_session
  end

  def include_capybara_dsl()
    include Capybara::DSL
  end