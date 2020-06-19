@wip
@web_ui
@landing
Feature: Landing Page

  @menu
  Scenario: User should see navigation widget
    When I open landing page
    Then I should be able to see landing page
    And the navigation widget should include the following columns
      | Travel Menu |
      | HOTELS      |
      | FLIGHTS     |
      | TOURS       |
      | CARS        |
      | VISA        |

  @visa
  Scenario: User can find appropriate visa
    When I open landing page
    And I choose visa menu at navigation widget
    And I choose Ukraine and Turkey on visa menu
    And I choose 31-12-2021 on visa date
    And I make visa query
    Then I should be able to see notification