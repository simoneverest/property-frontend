@US004/5/6 @PricePaid

Feature: View Most Recent Price Paid Information
  As a Citizen
  I want to see the most recent price paid
  So that I know what was paid for the property

    Acceptance Criteria
      display the most recent price paid
      display the date of the most recent price paid
      display the building type
      if price paid information is not available then display a meaningful message

    Scenario: View full price paid information
      Given I am a citizen
      And I have a property
      And it has most recent price paid value
      And it has the most recent price paid date
      And it has property type
      When I view the property detail page
      Then I can see the price paid value, date and property type

# Commented out as was unable to run in acceptance test due to lack of real data, was covered in unit testing though.
#    Scenario: Message displayed when price paid information unavailable
#      Given I am a citizen
#      And I have a property
#      And it has no price paid value
#      And it has the no price paid date
#      And it has no property type
#      When I view the property detail page
#      Then I can see a not available message
