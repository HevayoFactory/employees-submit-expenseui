# Expense Claims

## Problem Statement

Employees pay for business expenses out of pocket and today chase their manager by email or spreadsheet to get reimbursed, with finance then re-keying approved amounts into payroll by hand. There is no shared record of what was claimed, who approved it, or whether it has been paid out.

## Solution

A system where employees submit expense claims, managers review and approve or reject them, and finance exports the approved claims to payroll for payment — all against one shared, auditable record.

## Actors

- **Employee** — submits expense claims and tracks their status.
- **Manager** — reviews their team's claims and approves or rejects them.
- **Finance** — exports approved claims to payroll.

## Features

- F1 [Submit expenses](features/F1-submit-expenses.md)
- F2 [Approvals](features/F2-approvals.md)
- F3 [Payroll export](features/F3-payroll-export.md)

## Product-wide

See [Product-wide](product-wide.md) for rules spanning more than one feature.

## Out of Scope

- Multi-currency support.
- Multi-level approval chains.
- Corporate card reconciliation.

