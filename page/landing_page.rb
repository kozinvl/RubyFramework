require_relative '../page/base_page'

class LandingPage < BasePage

  elements :navigate_tabs, '.text-center .text-center'
  element :my_account, 'li#li_myaccount.open'

  def navigate_tab
    navigate_tabs.map(&:text)
  end
end