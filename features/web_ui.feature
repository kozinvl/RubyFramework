Feature: Web_UI

  Scenario: User should be able to see navigation bar
    When I open landing page
    Then User should be able to see landing page
    And the navigation bar should include the following columns:
      | Column  |
      | HOTELS  |
      | FLIGHTS |
      | TOURS   |
      | CARS    |
      | VISA    |