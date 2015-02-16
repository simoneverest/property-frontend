Feature: View Price Paid information
#Acceptance Criteria:
  #display the most recent price paid
  #display the date of the most recent price paid
  #display the building type
  #if price paid information is not available then display a meaningful message

@US004 @PricePaidInformation @GovUK
Scenario: Price paid information displayed
  Given I am a citizen
  And I have a property
  And it has a most recent price paid value
  And it has a most recent price paid date
  And it has a property type
  When I view the property detail page
  Then I can see the price paid, value, date and property type

@US004 @NoPricePaidInfomation @GovUK
Scenario: No price paid information displayed
  Given I am a citizen
  And I have a property
  And it has a most recent price paid value
  And it has no most recent price paid date
  And it has no property type
  When I view the property detail page
  Then I can see a ‘not available’ message
