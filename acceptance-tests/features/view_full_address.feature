Feature: View Full Address

@US001 @View_Full_Address
Scenario: View Full Address
  Given I am a citizen
  And I have a property
  When I view the property detail page
  Then I see the full address of the property

@US001 @View_Full_Address
Scenario: Address Does Not Exist
  Given I am a citizen
  And I try to view a property that does not exist
  When I view the property detail page
  Then I get a page not found message

@US012 @StatutoryServices @GovUK
Scenario: hyperlink to LR statutory services
  Given I am a citizen
  And I have a property
  When I view the property detail page
  Then a hyperlink to LR statutory services should be available
  When I click the LR Statutory services link
  Then I am taken to the Find a Property service
