# Approvals

## Purpose

Lets a manager review their team's submitted expense claims and approve or reject each one.

Needs: F1.

## User Stories

- F2.1 As a manager, I see my team's pending claims in one list, oldest first.
- F2.2 As a manager, I review a claim's expense lines, categories and receipts before deciding.
- F2.3 As a manager, I approve a claim.
- F2.4 As a manager, I reject a claim and must give a reason.
- F2.5 As a manager, I see a history of claims I have already approved or rejected.

## Decisions

- A claim is approved by a single level of approval: the employee's manager.
- A manager decides on the whole claim at once; expense lines within it are not approved or rejected separately.
- A rejection requires a reason.
- A rejected claim goes back to the employee, who can edit and resubmit it.

