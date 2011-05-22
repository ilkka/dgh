Feature: report downgrade candidates
  In order to fix my computer
  As an administrator
  I want to get a list of packages I need to downgrade

  Scenario: no downgradable packages
    Given that there are no downgradable packages
    When I run dgh
    Then no packages should be reported as downgrade candidates
