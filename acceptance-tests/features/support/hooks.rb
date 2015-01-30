Before do | scenario |

  # This chunk of code manages different authentication types.
  if page.driver.respond_to?(:basic_auth)
    page.driver.basic_auth($http_auth_name, $http_auth_password)
  elsif page.driver.respond_to?(:basic_authorize)
    page.driver.basic_authorize($http_auth_name, $http_auth_password)
  elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
    page.driver.browser.basic_authorize($http_auth_name, $http_auth_password)
  end

  # It's useful to blank out the referrer, this is needed for the mapping tests
  page.driver.add_header("Referer", "", permanent: true)

end

After do | scenario |
  # If the scenario failed let's take a screenshot. It helps for debugging
  if (scenario.failed?)
      save_screenshot("sshot-#{Time.new.to_i}.png", :full => true)
  end
end
