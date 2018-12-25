Feature: Landing Page

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

  Scenario: User should be able to get country visa requirements
    When I open landing page
    And I choose "visa" option
    And I select "Ukraine" and "United States"
    And I search query
    Then I should be able to see notification:
      | This country may require you to visit to the consulate. Click here to see a list of consulates near you. |