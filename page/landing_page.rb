require_relative '../page/base_page'
# Class contain locators and basic interaction with page
class LandingPage < BasePage

  element :title, 'div[class="title"]'
  elements :navigate_tabs, '.text-center .text-center'
  # # visa tab
  # element :visa, "[title = 'Ivisa']"
  # element :departure_country, "div[id='s2id_autogen4']"
  # element :arrival_country, "div[id ='s2id_autogen6']"
  # element :country_field, "[class*='select2-drop'] .select2-choice"
  # elements :search_result, "div[class*='select2-drop'] ul li"
  # element :search_visa_button, "div[id='ivisa'] form button"
  # elements :requirements_visa, "div[id='body-section'] .container h5"

  # cars tab
  element :cars, "[title = 'Cars']"
  element :search_cars, '.btn-primary i'

  element :my_account, "div[class='container'] #li_myaccount"
  elements :login, "div[class='container'] #li_myaccount ul a"

  def navigate_tab
    navigate_tabs.map(&:text)
  end

  def country_to_visa(departure, arrival)
    wait_until_departure_country_visible
    departure_country.click
    country_field.send_keys departure
    search_result.first.click
    arrival_country.click
    country_field.send_keys arrival
    search_result.first.click
  end

  def choice_cars(pick_up, drop_off)
    wait_until_cars_visible
    car_tour_field = 'div[id=cars] span[class=select2-chosen]'
    choice_city = '.select2-result-label'
    find(car_tour_field, text:'Pick up Location').click
    find(choice_city, text: "#{pick_up}").click
    find(car_tour_field, text: 'Drop off Location').click
    find(choice_city, text: "#{drop_off}").click
  end
end
