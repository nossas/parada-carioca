Feature: View the most recent activities
  In order to keep updated with new activities
  As an adventurer
  I want to view the most recent activities

  Scenario: when there are some activities in different dates
    Given there is an activity called "Aula de forró na praça São Salvador" created 3 days ago
    And there is an activity called "Velejada na Baía de Guanabara" created 2 days ago
    And there is an activity called "Feijoada da Portela" created 4 days ago
    When I go to "the homepage"
    Then the 1st most recent activity should be "Velejada na Baía de Guanabara"
    And the 2nd most recent activity should be "Aula de forró na praça São Salvador"
    And the 3rd most recent activity should be "Feijoada da Portela"
