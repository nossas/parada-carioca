Feature: create new event to an activity
  In order to let people subscribe to my activity
  As a guide
  I want to create new event to an activity

  @omniauth_test @javascript
  Scenario: 
    Given there is an activity
    And I go to "the events page of this activity"
    And I click "Criar Evento"
    And I fill "Data e Hora de Início" with next week
    And I fill "mín" with "2"
    And I fill "máx" with "10"
    And I select "8" as "Duração"
    And I fill "Preço por Pessoa (R$)" with "100"
    When I press "Criar Evento"
    Then I should see the created event message
