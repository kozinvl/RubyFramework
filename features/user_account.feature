Feature: Account Page

  Scenario: User should be able to get access to account with valid password
    When I open login page
    And I type correct password
    Then the UserAccountPage should be opened

  Scenario: User should be able to see personal information
    When I was logged as user
    And I open Personal details
    Then I should be able to see personal details