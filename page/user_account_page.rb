require_relative '../page/base_page'

class UserAccountPage < BasePage
  set_url_matcher 'account'

  element :avatar, "img[class='img-responsive go-right img-thumbnail']"
end