require_relative '../page/base_page'
# Class contain locators and basic interaction with page
class LoginPage < BasePage
  element :email, "div[class*='wow fadeIn animated'] input[type='email']"
  element :password, "div[class*='wow fadeIn'] input[type='password']"
  element :submit, 'button.btn-block.loginbtn'

  def log_in(user_email, user_password)
    wait_until_email_visible
    email.set(user_email)
    password.set(user_password)
    submit.click
  end
end
