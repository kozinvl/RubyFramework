# Page Object
class BasePage < SitePrism::Page

  def refresh
    page.driver.browser.navigate.refresh
  end

  def open
    url = "https://#{CommonVars::SITE_URL}"
    visit url
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until page.evaluate_script('jQuery.active').zero?
    end
  end
end
