Feature: View the most popular neighborhoods
  In order to know where people are going
  As an adventurer
  I want to view the most popular neighborhoods

  Scenario: when there are neighborhoods with different number of attendees
    Given there is an activity in "Laranjeiras" with 10 attendees
    And there is an activity in "Gávea" with 5 attendees
    And there is an activity in "Ipanema" with 15 attendees
    When I go to "the homepage"
    Then the 1st most popular neighborhood should be "Ipanema"
    And the 2nd most popular neighborhood should be "Laranjeiras"
    And the 3rd most popular neighborhood should be "Gávea"
