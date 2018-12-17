Feature: Web_UI

  Scenario: User should be able to see navigation bar
    When I open landing page
    Then I should be able to see landing page
    And the navigation bar should include the following columns:
      | Column  |
      | HOTELS  |
      | FLIGHTS |
      | TOURS   |
      | CARS    |
      | VISA    |

  Scenario: User should be able to get access to account with valid password
    When I open login page
    And I types correct passwords
    Then the UserAccountPage should be opened