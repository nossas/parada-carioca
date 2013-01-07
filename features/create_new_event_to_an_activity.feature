Feature: create new event to an activity
  In order to let people subscribe to my activity
  As a guide
  I want to create new event to an activity

  @omniauth_test @javascript
  Scenario: 
    Given I'm logged in
    And that I created an activity called "Passeio de bike na lagoa" in "Jardim Botânico"
    And I go to "the events page of this activity"
    And I click "Criar Nova Data"
    And I fill "Data e Hora de Início" with next week
    And I select "1" as "Mínimo de Participantes"
    And I select "10" as "Máximo de Participantes"
    And I select "8" as "Duração"
    And I fill "Preço por Pessoa (R$)" with "100"
    When I press "Criar Data"
    Then I should see the created event message
    
  @omniauth_test @javascript
  Scenario: when I leave all the fields blank
    Given I'm logged in
    And that I created an activity called "Passeio de bike na lagoa" in "Jardim Botânico"
    And I go to "the events page of this activity"
    And I click "Criar Nova Data"
    When I press "Criar Data"
    Then I should see "escolha uma data para a realização do evento"
