Feature: view the next events of an activity
  In order to plan when I'll join an activity
  As a visitor
  I want to view the next events of an activity

  Scenario: when the activity have no next event
    Given there is an activity
    When I go to "this activity page"
    Then I should see "Esta parada ainda não tem nenhuma data marcada"

  Scenario: when the activity have next events
    Given there is an activity
    And there is an event for this activity
    When I go to "this activity page"
    Then I should not see "Esta parada ainda não tem nenhuma data marcada"
    And I should see the participation form
