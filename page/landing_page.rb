require_relative '../page/base_page'

class LandingPage < BasePage

  elements :navigate_tabs, '.text-center .text-center'
  #visa tab
  element :visa, "[title = 'Ivisa']"
  element :departure_country, "div[id='s2id_autogen4']"
  element :arrival_country, "div[id ='s2id_autogen6']"
  element :country_field,"[class*='select2-drop'] .select2-choice"
  elements :search_result, "div[class*='select2-drop'] ul li"
  element :search_visa_button, "div[id='ivisa'] form button"
  elements :requirements_visa, "div[id='body-section'] .container h5"


  element :my_account, 'div[class="container"] #li_myaccount'
  elements :login, 'div[class="container"] #li_myaccount ul a'

  def navigate_tab
    navigate_tabs.map(&:text)
  end

  def country_to_visa (departure, arrival)
    wait_until_departure_country_visible
    departure_country.click
    country_field.send_keys departure
    search_result.first.click
    arrival_country.click
    country_field.send_keys arrival
    search_result.first.click
  end
end