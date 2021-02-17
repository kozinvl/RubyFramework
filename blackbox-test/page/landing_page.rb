require_relative 'base_page'
# Class contain locators and basic interaction with page
class LandingPage < BasePage
  element :logo, '.header-logo.go-right'
  element :navigate_tabs, "ul[class='nav row-reverse ']"
  # menu
  element :cars, '.text-center.transfer'
  element :visa, '.text-center.visa'

  elements :visa_directions, "div[id='visa'] div a"
  elements :visa_country_list, "div[id='visa'] div[class='chosen-drop'] input"
  element :visa_submit, "div[id='visa'] button[type='submit']"
  element :visa_date, "input[class='visadate form-control form-bg-light']"

  element :search_cars, '.btn-primary i'
  element :search_result, "h5[class='cw wow fadeIn sub-title animated animated']"

  # my_account
  element :my_account, "div[class='container'] #li_myaccount"
  elements :login, "div[class='container'] #li_myaccount ul a"

  def navigate_menu
    navigate_tabs.text.split("\n")
  end

  def choice_visa(from, where)
    visa_directions.first.click
    visa_country_list.first.set(from.to_s).send_keys :return
    visa_directions.last.click
    send('visa_country_list').last.set(where.to_s).send_keys :return
  end

  # function should be refactored
  def choice_cars(pick_up, drop_off)
    wait_until_cars_visible
    car_tour_field = 'div[id=cars] span[class=select2-chosen]'
    choice_city = '.select2-result-label'
    find(car_tour_field, text: 'Pick up Location').click
    find(choice_city, text: pick_up.to_s).click
    find(car_tour_field, text: 'Drop off Location').click
    find(choice_city, text: drop_off.to_s).click
  end
end
