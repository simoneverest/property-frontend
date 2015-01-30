Feature: Find Property

Scenario: View Price Paid
  Given I am a citizen
  And I have a property
  When I view the property detail page
  Then I see the price paid of the property
