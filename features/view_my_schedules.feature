Feature: view my schedules
  In order to keep track of my schedules
  As a visitor
  I want to view my schedules

  @omniauth_test
  Scenario: there is no schedule
    Given I'm logged in
    When I go to "my schedules page"
    Then I should see "Pelo visto você é novo por aqui, nenhum agendamento encontrado"

  @omniauth_test
  Scenario: there is some schedules
    Given I'm logged in
    And I scheduled 2 activities
    When I go to "my schedules page"
    Then I should not see "Pelo visto você é novo por aqui, nenhum agendamento encontrado"
    And I should see 2 schedules
