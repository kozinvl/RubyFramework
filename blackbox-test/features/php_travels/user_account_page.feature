@wip
@web_ui
@account
Feature: Account Page

  Scenario: Should get access to account with valid password
    When I open login page
    And I type correct password
    Then the UserAccountPage should be opened

  Scenario: Should see personal information
    Given I was logged as user
    And I open Personal details
    Then I should be able to see personal details