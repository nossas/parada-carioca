Feature: rate an activity
  In order to share my experience with other visitors
  As a visitor
  I want to rate an activity

  @omniauth_test @javascript
  Scenario: I'm logged in
    Given I'm logged in
    And there is an activity
    And I go to "this activity page"
    And I click "escrever avaliação"
    And I fill "O que achou da parada? E do guia?" with "Sensacional!"
    When I press "Enviar Avaliação"
    Then I should be in "the reviews of this activity page"
    And I should see "Irado! Agradecemos a sua avaliação"
  
  @javascript
  Scenario: I'm not logged in
    Given there is an activity
    When I go to "this activity page"
    Then I should not see "escrever avaliação"
