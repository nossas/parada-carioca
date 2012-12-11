Feature: Login with my Facebook account
  In order to promote my activity
  As a guide
  I want to login with my Facebook account

  @omniauth_test
  Scenario: 
    Given I go to "the homepage"
    When I click "the Facebook login button"
    Then I should see "the user panel" component
    And I should not see "the Facebook login" component
