Feature: F1 Submit expenses

  @story-F1.1
  Rule: An employee builds a draft claim from one or more expense lines

    Scenario: Adding a second line to a draft claim
      Given Priya the employee has a draft claim with one expense line
      When Priya adds a second expense line of "$12.00" for "Parking"
      Then the draft claim has two expense lines

  @story-F1.2
  Rule: Each expense line has a category from the fixed built-in list

    Scenario: Picking a category for a line
      Given Priya the employee is adding an expense line for "Taxi to airport"
      When Priya picks the category "Travel"
      Then the line's category is "Travel"

  @story-F1.3
  Rule: An agent suggests a category for an expense line, which the employee may accept or change

    Scenario: Accepting the suggested category
      Given Priya the employee is adding an expense line described as "Dinner with client"
      And the agent has suggested the category "Meals" for that line
      When Priya accepts the suggestion
      Then the line's category is "Meals"

    Scenario: Choosing a different category than suggested
      Given Priya the employee is adding an expense line described as "Dinner with client"
      And the agent has suggested the category "Meals" for that line
      When Priya picks the category "Travel" instead
      Then the line's category is "Travel"

  @story-F1.4
  Rule: A receipt is required for any expense line above $25

    Scenario: Submitting a line over $25 without a receipt
      Given Priya the employee has a draft claim with one expense line of "$40.00" and no receipt
      When Priya submits the claim
      Then the claim is still a draft

    Scenario: A line of $25 or under needs no receipt
      Given Priya the employee has a draft claim with one expense line of "$25.00" and no receipt
      When Priya submits the claim
      Then the claim is pending

  @story-F1.5
  Rule: An employee submits a draft claim to their manager for approval

    Scenario: Submitting a complete draft claim
      Given Priya the employee has a draft claim with one expense line of "$18.00" and no receipt
      When Priya submits the claim
      Then the claim is pending

  @story-F1.6
  Rule: An employee may edit or withdraw a claim that is still pending

    @negative
    Scenario: Withdrawing a pending claim
      Given Priya the employee has a claim that is pending
      When Priya withdraws the claim
      Then the claim is a draft again

  @story-F1.7
  Rule: An employee may edit and resubmit a claim their manager rejected

    Scenario: Resubmitting a rejected claim
      Given Priya the employee has a claim that was rejected with the reason "Missing receipt"
      When Priya attaches a receipt and resubmits the claim
      Then the claim is pending

  @story-F1.8
  Rule: An employee sees the status of each of their claims

    Scenario: Viewing claim statuses
      Given Priya the employee has a draft claim, a pending claim, an approved claim and a rejected claim
      When Priya views her claims
      Then she sees one claim with each of the statuses draft, pending, approved and rejected
