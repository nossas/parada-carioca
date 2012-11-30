Feature: View details of an Activity
  In order to know more about an activity
  as a visitor
  I want to view details of an activity
  

  Scenario: I'm exploring the home page
    Given there is an activity called "Aula de forró na praça São Salvador" with 2 attendees
    And there is an activity called "Velejada na Baía de Guanabara" with 4 attendees
    And there is an activity called "Feijoada da Portela" with 3 attendees
    And I go to "the homepage"
    When I click "Aula de forró na praça São Salvador"
    Then I should see "Aula de forró na praça São Salvador"
    And I should see "Qual é a Parada?"
