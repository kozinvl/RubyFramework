@Landing
Feature: Landing Page

#  Scenario: User should be able to see navigation bar
#    When I open landing page
#    Then I should be able to see landing page
#    And the navigation bar should include the following columns:
#      | Column  |
#      | HOTELS  |
#      | FLIGHTS |
#      | TOURS   |
#      | CARS    |

  @wip
  Scenario: User should not be able to find appropriate car
    When I open landing page
    And I choose "cars" option
    And I select "Manchester" and "Malaysia" location
    And I search query
#    Then I should be able to see notification:
#      | No Results Found |