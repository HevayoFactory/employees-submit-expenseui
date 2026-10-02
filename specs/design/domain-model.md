# Domain model

The core entities behind expense claims, their approval, and their export to payroll.

```mermaid
erDiagram
    EMPLOYEE ||--o{ EXPENSE_CLAIM : submits
    EMPLOYEE ||--o{ EMPLOYEE : manages
    EXPENSE_CLAIM ||--|{ EXPENSE_LINE : contains
    EXPORT ||--o{ EXPENSE_CLAIM : includes

    EMPLOYEE {
        string id
        string name
        string managerId
    }
    EXPENSE_CLAIM {
        string id
        string employeeId
        string status
        string rejectionReason
        datetime submittedAt
        datetime decidedAt
    }
    EXPENSE_LINE {
        string id
        string claimId
        decimal amount
        string category
        string categorySource
        string receiptRef
    }
    EXPORT {
        string id
        string exportedBy
        datetime exportedAt
    }
```

- **Employee** has at most one manager (`managerId`, self-relation), used to resolve a manager's team.
- **ExpenseClaim** status is one of `draft`, `pending`, `approved`, `rejected`, `exported`; `rejectionReason` is set only when rejected.
- **ExpenseLine** belongs to exactly one claim; `category` comes from the fixed built-in list; `categorySource` records whether the employee picked it or accepted the agent's suggestion; `receiptRef` is set when a receipt was attached (required above $25).
- **Export** groups the claims it swept up at the time finance ran it; an exported claim's status becomes `exported` and it is never included again.