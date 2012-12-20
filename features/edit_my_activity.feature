Feature: Edit an activity
  In order to keep my activity update
  As an user
  I want to be able to edit my activity

  
  Scenario: I'm not the activity owner neither logged in
    Given there is an activity called "Passeio de bike na lagoa" in "Jardim Botânico" 
    And I'm in the homepage
    When I click "Passeio de bike na lagoa"
    Then I should not see "Editar Parada" 

  @omniauth_test
  Scenario: I'm not activity owner and I'm logged in
    Given I'm logged in
    And there is an activity called "Passeio de bike na lagoa" in "Jardim Botânico"
    And I'm in the homepage
    When I click "Passeio de bike na lagoa"
    Then I should not see "Editar Parada" 

  @omniauth_test
  Scenario: I'm the activity owner and I'm logged in
    Given I'm logged in
    And that I created an activity called "Passeio de bike na lagoa" in "Jardim Botânico"
    And I'm in the homepage
    And I click "Passeio de bike na lagoa"
    When I click "Editar Parada"
    Then I should see "Dashboard"

  @omniauth_test @javascript
  Scenario: I'm the activity owner, I'm logged in and I want to make some changes, but I forgot to fill some fields
    Given I'm logged in 
    And that I created an activity called "Passeio de bike na lagoa" in "Jardim Botânico"
    And I'm in the homepage
    And I click "Passeio de bike na lagoa"
    And I click "Editar Parada"
    And I click "Informações básicas"
    And I fill "Nome da Parada" with ""
    And I fill "Descrição" with "Descrição"
    And I set the activity location in "Estrada do Joá próximo ao número 450"
    And I select "São Conrado" as "Bairro"
    When I press "Atualizar Parada"
    Then I should see "Ocorreu um problema ao atualizar. Por favor, cheque se você preencheu corretamente os campos abaixo."


  @omniauth_test @javascript
  Scenario: I'm the activity owner, I'm logged in, I want to make some changes and fill every required field
    Given I'm logged in 
    And that I created an activity called "Passeio de bike na lagoa" in "Jardim Botânico"
    And I'm in the homepage
    And I click "Passeio de bike na lagoa"
    And I click "Editar Parada"
    And I click "Informações básicas"
    And I fill "Nome da Parada" with "Passei de bike na Lago do Rio de Janeiro"
    And I fill "Descrição" with "Descrição"
    And I set the activity location in "Estrada do Joá próximo ao número 450"
    And I select "São Conrado" as "Bairro"
    When I press "Atualizar Parada"
    Then I should see "Parada atualizado(a) com sucesso!"


