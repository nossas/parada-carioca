Feature: View the most popular guides
  In order to meet the best guides
  As an adventurer
  I want to view the most popular guides

  Scenario: when there are activities with different number of adventurers
    Given there is a guide called "Luiz Fonseca" and email "luiz@paradacarioca.org.br"
    And there is an activity of "luiz@paradacarioca.org.br" with 5 attendees
    And there is an activity of "luiz@paradacarioca.org.br" with 10 attendees
    And there is a guide called "Nícolas Iensen" and email "nicolas@paradacarioca.org.br"
    And there is an activity of "nicolas@paradacarioca.org.br" with 10 attendees
    And there is an activity of "nicolas@paradacarioca.org.br" with 10 attendees
    When I go to "the homepage"
    Then the 1st most popular guide should be "Nícolas Iensen"
    And the 2nd most popular guide should be "Luiz Fonseca"
