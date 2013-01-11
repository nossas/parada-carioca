Feature: view my activities
  In order to brower my activities
  As a guide
  I want to view my activities

  @omniauth_test
  Scenario: there is no activity of mine
    Given I'm logged in
    When I click "Minhas Paradas"
    Then I should see "Você ainda não organizou nenhuma parada, comece agora!"

  @omniauth_test
  Scenario: there is a activity of mine
    Given I'm logged in
    And there is an activity created by me
    When I click "Minhas Paradas"
    Then I should not see "Você ainda não organizou nenhuma parada, comece agora!"
    And I should see my activity
