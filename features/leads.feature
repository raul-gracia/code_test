Feature: Leads Generation

   As a user running the application
   I can see some basic information about the company and submit my contact details for a call back
   So that I can request a call back

   Scenario: User can submit valid info
    Given I visit the home page
    And I fill the form with valid info
    When I submit the form
    Then I should see a success message

   Scenario: User can submit invalid info
    Given I visit the home page
    And I fill the form with invalid info
    When I submit the form
    Then I should see an error message

   Scenario: Api service is unavailable
    Given I visit the home page
    And api service is misconfigured
    And I fill the form with valid info
    When I submit the form
    Then I should see an api error message
