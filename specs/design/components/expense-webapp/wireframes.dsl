screen MyClaims "An employee's own expense claims and their status"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  row
    heading "My Claims"
    right
    button "New Claim" primary -> NewClaim
  table "Date | Lines | Total | Status" -> ClaimDetail
    row "Oct 1 | 2 | $84.00 | Draft"
    row "Sep 28 | 3 | $142.50 | Pending"
    row "Sep 20 | 1 | $18.00 | Approved"
    row "Sep 12 | 1 | $60.00 | Rejected"

screen NewClaim "An employee builds a draft claim from one or more expense lines"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "New Claim"
  card "Expense line"
    row
      input "Description"
      input "Amount"
      select "Category"
    text "Suggested category: Travel (from receipt)"
    row
      button "Accept suggestion"
      button "Choose a different category"
    input "Receipt (required above $25)"
    button "Add another line"
  row
    right
    button "Save as draft"
    button "Submit for approval" primary -> MyClaims

screen ClaimDetail "One of the employee's own claims, its lines and status"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "Claim · Sep 28"
  badge "Pending" warning
  table "Description | Category | Amount | Receipt"
    row "Taxi | Travel | $42.50 | Attached"
    row "Lunch | Meals | $100.00 | Attached"
  text "Rejection reason: none"
  row
    right
    button "Withdraw"
    button "Edit" -> EditClaim

screen EditClaim "An employee edits a draft or rejected claim and resubmits it"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "Edit Claim"
  card "Expense line"
    row
      input "Description"
      input "Amount"
      select "Category"
    input "Receipt (required above $25)"
  row
    right
    button "Cancel" -> ClaimDetail
    button "Resubmit" primary -> MyClaims

flow "Submit and track claims"
  role "Employee"
  description "An employee builds a claim, tracks it, and edits a rejected one"
  MyClaims
  NewClaim
  ClaimDetail
  EditClaim

screen TeamQueue "A manager's direct reports' pending claims, oldest first"
  navbar "Expense Claims"
  sidebar "Pending -> TeamQueue | History -> TeamHistory"
  heading "Pending Claims"
  table "Employee | Date | Lines | Total" -> ClaimReview
    row "Dana Lee | Sep 28 | 3 | $142.50"
    row "Sam Patel | Sep 25 | 1 | $30.00"

screen ClaimReview "A manager reviews one pending claim and decides it"
  navbar "Expense Claims"
  sidebar "Pending -> TeamQueue | History -> TeamHistory"
  heading "Claim · Dana Lee · Sep 28"
  table "Description | Category | Amount | Receipt"
    row "Taxi | Travel | $42.50 | Attached"
    row "Lunch | Meals | $100.00 | Attached"
  textarea "Reason (required to reject)"
  row
    right
    button "Reject" danger -> TeamQueue
    button "Approve" primary -> TeamQueue

screen TeamHistory "Claims a manager has already approved or rejected"
  navbar "Expense Claims"
  sidebar "Pending -> TeamQueue | History -> TeamHistory"
  heading "Decision History"
  table "Employee | Date | Total | Decision"
    row "Dana Lee | Sep 10 | $64.00 | Approved"
    row "Sam Patel | Sep 5 | $22.00 | Rejected"

flow "Approval queue"
  role "Manager"
  description "A manager reviews pending claims and checks past decisions"
  TeamQueue
  ClaimReview
  TeamHistory

screen ExportClaims "Finance sweeps every approved, not-yet-exported claim into a downloadable file"
  navbar "Expense Claims"
  sidebar "Export -> ExportClaims | History -> ExportHistory"
  heading "Export to Payroll"
  text "12 approved claims are ready to export, totaling $1,204.00"
  button "Export Approved Claims" primary // completes in place: triggers the download and updates the ready count
  text "Exported 12 claims · download started" muted

screen ExportHistory "Finance's past payroll exports"
  navbar "Expense Claims"
  sidebar "Export -> ExportClaims | History -> ExportHistory"
  heading "Export History"
  table "Date | Claims | Exported By"
    row "Sep 30 | 9 | Pat Finance"
    row "Sep 15 | 14 | Pat Finance"

flow "Payroll export"
  role "Finance"
  description "Finance exports approved claims and reviews past exports"
  ExportClaims
  ExportHistory
