Feature: View the most recent events
  In order to keep updated with new events
  As an adventurer
  I want to view the most recent events

  Scenario: when there are some events created in different dates
    Given there is an event called "Aula de forró na praça São Salvador" created 3 days ago
    And there is an event called "Velejada na Baía de Guanabara" created 2 days ago
    And there is an event called "Feijoada da Portela" created 4 days ago
    When I go to "the homepage"
    Then the 1st most recent event should be "Velejada na Baía de Guanabara"
    And the 2nd most recent event should be "Aula de forró na praça São Salvador"
    And the 3rd most recent event should be "Feijoada da Portela"
