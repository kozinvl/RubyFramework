require_relative '../page/base_page'
# Class contain locators and basic interaction with page
class LandingPage < BasePage

  element :title, 'div[class="title"]'
  elements :navigate_tabs, '.text-center .text-center'
  # cars tab
  element :cars, "[title = 'Cars']"
  element :search_cars, '.btn-primary i'
  element :search_cars_result, 'h1[class=text-center]'

  element :my_account, "div[class='container'] #li_myaccount"
  elements :login, "div[class='container'] #li_myaccount ul a"

  def navigate_tab
    navigate_tabs.map(&:text)
  end

  # WIP
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
