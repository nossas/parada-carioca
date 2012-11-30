Feature: View the top activities
  In order to find something cool to do
  As an adventurer
  I want to view the top activities

  Scenario: when there are activities with different number of adventurers
    Given there is an activity called "Aula de forró na praça São Salvador" with 2 attendees
    And there is an activity called "Velejada na Baía de Guanabara" with 4 attendees
    And there is an activity called "Feijoada da Portela" with 3 attendees
    When I go to "the homepage"
    Then the first activity should be "Velejada na Baía de Guanabara"
    And I should see "Feijoada da Portela"
    And I should see "Aula de forró na praça São Salvador"
