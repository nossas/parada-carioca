Feature: View the activity reviews
  In order to better know an activity
  As a visitor
  I want to view the activity reviews

  Scenario: when the activity have some reviews
    Given there is an activity
    And there is a review for this activity written by "Alan" 10 days ago
    And there is a review for this activity written by "Airton" 15 days ago
    And there is a review for this activity written by "Anderson" 5 days ago
    When I go to "this activity page"
    Then the 1st review should be of "Anderson"
    And the 2nd review should be of "Alan"
    And the 3rd review should be of "Airton"
