require_relative '../page/base_page'

class UserAccountPage < BasePage
  set_url_matcher 'account'

  element :avatar, "img[class='img-responsive go-right img-thumbnail']"
  element :my_profile, ".profile-tabs li .profile-icon"
  element :first_name, "[name='firstname']"
  element :last_name, "[name='lastname']"
  element :phone, "[name='phone']"
end
