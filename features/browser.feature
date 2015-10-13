Feature: Example for Browser steps

  Scenario: Simple Google search with steps
    Given the browser is phantomjs
    # Given the browser is chrome
    And I visit the following url: www.google.com
    And The browser should match the following url: www.google.hu
    Then I write in the browser the following value where matching attributes: name="q"
    """
    test
    """
    And there is a html element with the following text: testbike
#    And the div with the attributes: id="sb_ifc0" should match the following text: test

