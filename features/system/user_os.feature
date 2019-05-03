@OSystem
Feature: Interaction with system

  Scenario Outline: Creating working elements
    When I go to "<directory>"
    And I create "<object>" with name "<name>"
    And I put "<text>" in file
    Then File should exist and contain text
    Examples:
      | directory     | object | name      | text |
      | sys_directory | file   | readme.md | text |

  Scenario: Change file permission
    Given I have created file with text
    And I execute "chmod" in console with params:
    """
      +x 777
    """
    Then File should have permission
