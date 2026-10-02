Feature: F2 Approvals

  @story-F2.1
  Rule: A manager sees their team's pending claims in one list, oldest first

    Scenario: Viewing the pending queue
      Given Priya the employee, who reports to Omar the manager, has a pending claim submitted on "Sep 20"
      And Dana the employee, who also reports to Omar, has a pending claim submitted on "Sep 25"
      When Omar opens his pending queue
      Then Priya's claim appears before Dana's claim

    @negative
    Scenario: A manager does not see another manager's team
      Given Dana the employee reports to Omar the manager and has a pending claim
      And Priya the employee reports to a different manager, Lee
      When Lee opens his pending queue
      Then Dana's claim does not appear in it

  @story-F2.2
  Rule: A manager reviews a claim's expense lines, categories and receipts before deciding

    Scenario: Reviewing a pending claim's lines
      Given Dana the employee, who reports to Omar the manager, has a pending claim with a "$42.50" "Travel" line with a receipt attached
      When Omar opens that claim
      Then he sees the line's amount, category and that a receipt is attached

  @story-F2.3
  Rule: A manager approves a pending claim from their team

    Scenario: Approving a pending claim
      Given Dana the employee, who reports to Omar the manager, has a pending claim
      When Omar approves the claim
      Then the claim is approved

  @story-F2.4
  Rule: A manager must give a reason when rejecting a claim

    Scenario: Rejecting a claim with a reason
      Given Dana the employee, who reports to Omar the manager, has a pending claim
      When Omar rejects the claim with the reason "Missing receipt"
      Then the claim is rejected with the reason "Missing receipt"

    @negative
    Scenario: Rejecting without a reason is refused
      Given Dana the employee, who reports to Omar the manager, has a pending claim
      When Omar tries to reject the claim without giving a reason
      Then the claim is still pending

  @story-F2.5
  Rule: A manager sees a history of claims they have already decided

    Scenario: Viewing decision history
      Given Omar the manager approved Dana's claim on "Sep 10" and rejected Priya's claim on "Sep 12"
      When Omar views his decision history
      Then he sees both the approved claim and the rejected claim
