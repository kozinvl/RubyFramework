@system
Feature: Interaction with system

  Scenario Outline: Creating working elements
    When I go to sys_directory
    And I create file with "<name>"
    And I put "<text>" in file with "<name>"
    Then file "<name>" should exist
    And file "<name>" should contain "<text>"
    Examples:
      | name      | text   |
      | system.md | key_$1 |

  Scenario: Change file permission
    Given I have created file with text
    And I execute chmod in console with params:
    """
     777
    """
    Then file should have permission
