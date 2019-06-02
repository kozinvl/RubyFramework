require_relative 'base_page'
# Class contain locators and basic interaction with page
class UserAccountPage < BasePage
  set_url_matcher 'account'
  # locators
  element :avatar, "img[class='img-responsive go-right img-thumbnail']"
  element :my_profile, '.profile-tabs li .profile-icon'
  element :first_name, "[name='firstname']"
  element :last_name, "[name='lastname']"
  element :phone, "[name='phone']"
end
