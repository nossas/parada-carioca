Feature: send my activity to moderation
  In order to guide people to an awesome Rio experience
  As a guide
  I want to send my activity to moderation

  @omniauth_test @javascript
  Scenario: when I'm logged in
    Given I'm logged in
    And I click "Organizar Parada"
    And I fill "Nome da Parada" with "Pular da Pedra da Gávea de asa-delta"
    And I attach an image to "Foto"
    And I fill "Descrição" with "Voar voar, subir subir..."
    And I set the activity location in "Estrada do Joá próximo ao número 450"
    And I select "São Conrado" as "Bairro"
    And I fill "Preço Médio por Pessoa (R$)" with "300"
    When I press "Continuar"
    Then I should be in "the events page of the new activity"
    And I should see the awaiting moderation warning

  @omniauth_test
  Scenario: when I leave all fields blank
    Given I'm logged in
    And I click "Organizar Parada"
    When I press "Continuar"
    Then I should see "da um nomezinho bonitinho pra parada"
    And I should see "queremos saber do que se trata a sua parada"
    And I should see "escolha um endereço sugerido por nós"
    And I should see "uma fotinho só vai"
    And I should see "quanto (em média)?"

  @omniauth_test
  Scenario: when I'm not logged in
    Given I go to "the homepage"
    When I click "Organizar Parada"
    Then I should be in "the new activity page"
