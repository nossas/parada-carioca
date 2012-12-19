Feature: schedule a date
  In order to book an activity
  As a visitor
  I want to schedule a date

  @omniauth_test @javascript
  Scenario: I'm logged in
    Given I'm logged in
    And there is an activity with 1 event
    And I go to "this activity page"
    And I select a date to schedule
    And I press "Agendar Parada"
    And I fill "Telefone" with "(21)9999-9999"
    When I press "Atualizar Telefone"
    Then the Moip checkout button should be enable
