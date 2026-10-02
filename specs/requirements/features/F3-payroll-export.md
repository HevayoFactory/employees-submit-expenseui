# Payroll export

## Purpose

Lets finance export approved expense claims for payment through payroll.

Needs: F2.

## User Stories

- F3.1 As finance, I export all approved claims that have not yet been exported as a downloadable file, on demand.
- F3.2 As finance, I see a history of past exports, including which claims were in each one.

## Decisions

- The payroll system to export to is not yet named; the export capability is described independent of a specific system.
- Export produces a downloadable file (e.g. CSV); getting it into payroll is a separate, manual step outside this product.
- An export is triggered by finance on demand; it is not scheduled automatically.
- Every export includes all approved claims not yet exported; finance does not select individual claims.
- Once a claim is exported, it is marked exported and excluded from all future exports.

