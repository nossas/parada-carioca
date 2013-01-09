Feature: cancel an event
  In order to warn the attendees about a problem in an event
  As a guide
  I want to cancel an event

  @omniauth_test
  Scenario: there is no attendee in the event
    Given I'm logged in
    And there is an activity created by me with 1 event
    And I go to "the events page of this activity"
    When I click "Cancelar data"
    Then I should see "Sua data foi cancelada"

  @omniauth_test
  Scenario: there is some attendees in the event
    Given I'm logged in
    And there is an activity created by me
    And there is an event for this activity
    And there is 1 attendee in this event
    And I go to "the events page of this activity"
    When I click "Cancelar data"
    Then I should see "Sua data foi cancelada"
    And the system should send 2 emails
