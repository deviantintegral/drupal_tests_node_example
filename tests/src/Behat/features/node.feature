@javascript @api
Feature: Node module content display
  In order to see content
  As an anonymous user
  I need to be able to find it easily from the site home page

  Scenario: A saved node shows up on the home page
    # We need this step to initialize the session so screenshots work.
    Given I am on the homepage
    And users:
      | name       | mail            | status |
      | Joe Editor | joe@example.com | 1      |
    And "article" content:
      | title    | author     | status | created           |
      | Test article | Joe Editor | 1      | 2014-10-17 8:00am |
    And I am on the homepage
    Then I should see the text "Test article"
