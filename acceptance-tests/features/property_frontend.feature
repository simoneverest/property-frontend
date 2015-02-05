Feature: Find Property

@US004 @View_PPI_Information
Scenario: View Price Paid
  Given I am a citizen
  And I have a property
  When I view the property detail page
  Then I see the price paid of the property


@US001 @View_Full_Address



@US001 @View_Full_Address
Scenario: View Full Address
  Given I am a citizen
  And I have a property
  When I view the property detail page
  Then I see the full address of the property


@US001 @View_Full_Address
Scenario: Address Does Not Exist
  Given I am a citizen
  When I view a property that does not exist
  Then I get a page not found message
