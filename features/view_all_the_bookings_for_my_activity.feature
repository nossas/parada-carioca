Feature: view all the bookings for my activity
  In order to know the people who booked my activity
  As a guide
  I want to view all the bookings for my activity

  @omniauth_test @javascript
  Scenario: there is a an event with a booking
    Given I'm logged in
    And there is an activity of mine
    And there is an event for this activity
    And there is a booking of "João Pessanha" to that event
    And I go to "this activity page"
    When I click "Quem Agendou"
    Then I should see "João" in the attendees list
  
  @omniauth_test @javascript
  Scenario: there is no event
    Given I'm logged in
    And there is an activity of mine
    And I go to "this activity page"
    When I click "Quem Agendou"
    Then I should see "Esta atividade não possui datas futuras para serem agendadas"

  @omniauth_test @javascript
  Scenario: I'm not the owner of the activity
    Given I'm logged in
    And there is an activity
    When I go to "this activity page"
    Then I should not see the activity tab
