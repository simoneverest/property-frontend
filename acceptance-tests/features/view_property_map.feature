Feature: View Property Map

@US001 @ViewPropertyOnMap
Scenario: View Correct Map Location
  Given I am a citizen
  And I have a property
  When I view the property detail page
  Then I see the map to the correct coordinates

@US007 @ViewPropertyOnMapNoCooords
Scenario: View No Map Available
  Given I am a citizen
  And I have a property that does not have location coordinates
  When I view the property detail page
  Then a message is shown in place of the map section
