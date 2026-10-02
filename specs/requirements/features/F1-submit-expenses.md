# Submit expenses

## Purpose

Lets an employee record an expense claim, attach a receipt when required, and track its status through to approval or rejection.

## User Stories

- F1.1 As an employee, I create a draft claim and add one or more expense lines to it.
- F1.2 As an employee, I pick a category for each expense line from a fixed, built-in list.
- F1.3 As an employee, I see an agent's suggested category for an expense line, and can accept it or pick a different one.
- F1.4 As an employee, I attach a receipt to an expense line over $25.
- F1.5 As an employee, I submit a draft claim to my manager for approval.
- F1.6 As an employee, I edit or withdraw a claim that is still pending my manager's decision.
- F1.7 As an employee, I edit and resubmit a claim my manager rejected.
- F1.8 As an employee, I see the status of each of my claims: draft, pending, approved or rejected.

## Decisions

- A claim groups one or more expense lines, each with its own amount, category and receipt.
- A receipt must be attached for any expense line above $25.
- Expense categories come from a fixed, built-in list; nobody edits it in-product.

