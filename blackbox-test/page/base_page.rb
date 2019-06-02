# Page Object
class BasePage < SitePrism::Page
  element :title, '.title'

  def refresh
    page.driver.browser.navigate.refresh
  end

  def open
    url = "https://#{CommonVars::SITE_URL}"
    visit url
  end
end
