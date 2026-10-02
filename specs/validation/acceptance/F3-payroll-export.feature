Feature: F3 Payroll export

  @story-F3.1
  Rule: Finance exports every approved, not-yet-exported claim as a downloadable file, on demand

    Scenario: Exporting the approved claims
      Given 2 approved claims have never been exported
      When Pat from finance exports approved claims
      Then a downloadable export containing those 2 claims is produced

    Scenario: An already-exported claim is not included again
      Given Dana's claim was approved and included in an export on "Sep 15"
      And a new claim from Priya was approved after that export
      When Pat from finance exports approved claims
      Then the new export contains only Priya's claim

  @story-F3.2
  Rule: Finance sees a history of past exports, including which claims were in each one

    Scenario: Viewing export history
      Given an export on "Sep 15" included Dana's claim
      And an export on "Sep 30" included Priya's claim
      When Pat from finance views the export history
      Then she sees both exports, each listing the claim it included
