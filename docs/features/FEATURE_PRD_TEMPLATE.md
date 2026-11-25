# Feature PRD Template

Copy this file to `docs/features/P-F0x-<short-name>.md` **before the feature's first implementation task**. Keep it short. Reference the Master PRD (`docs/prd/`) instead of repeating it: copy only what this feature needs, and cite IDs (FR-xx, US-xx, AC-xx.y, S-xx, W-xx, E-xx, NFR-xx).

A Feature PRD does not need the 15 sections of the Master PRD. If it disagrees with the Master PRD, raise a decision and update both; do not let them drift apart.

---

# P-F0x — <Feature title>

| Field | Value |
|---|---|
| Feature ID | P-F0x |
| Master PRD version | e.g. v2.0 |
| Status | `DRAFT` · `APPROVED` · `IN_PROGRESS` · `READY_FOR_HUMAN_REVIEW` · `DONE` |
| GitHub Issues | #… , #… |
| Last updated | YYYY-MM-DD |

## 1. Feature ID and title
P-F0x — <title>. Old feature IDs covered: F-xx, F-yy (Master PRD §7.6).

## 2. Goal and problem
What user problem this feature solves, in two or three sentences. Which Master PRD goals (G-x) it supports.

## 3. User types
Which roles use it (Resident, Guest, Administrator, System) and what each may and may not do here.

## 4. Functional behaviour
The behaviour in plain language, then the requirements it implements:

| FR | Summary | Priority |
|---|---|---|
| FR-xx | … | Must |

## 5. User stories
US-xx from the Master PRD, plus any story specific to this feature.

## 6. Acceptance criteria
Given / When / Then. Mark each H (happy path), E (error) or X (edge case). Reuse Master PRD AC IDs; number new ones AC-xx.y within the feature's story.

| ID | Type | Criterion | Automated test? |
|---|---|---|---|
| AC-xx.1 | H | Given … when … then … | unit / widget / backend / integration / E2E / manual |

## 7. Screens or interactions (if relevant)
Screens (S-xx, W-xx), states (loading, empty, error, success), navigation, RTL and accessibility notes. Link wireframes; do not redraw them unless they change.

## 8. Data and API dependencies
Entities read and written (E-xx). API endpoints or functions: name, input, output, errors, who calls them. Dependencies on other features (P-F0x) and external services.

## 9. Errors and edge cases
Offline, slow network, double submission, concurrency, invalid input, permission denied, time zone/DST, service unavailable.

## 10. Testing requirements
Which tests prove the acceptance criteria, at which layer, who writes them, and which negative cases (invalid, expired, suspended, cancelled, exhausted, concurrent) apply. Required review level (light / focused / deep) per `docs/team/WORKFLOW.md`, Section 5.

## 11. Human coordinator
Contributor (A/B/C) who keeps this Feature PRD current and checks that the parts fit together.

## 12. Contributing developers
| Contributor | Component / tasks | AI agent |
|---|---|---|
| A | … | Claude Code |

## 13. Sprint and milestone
Planned sprint(s), and the milestone it counts toward (M1 MVP or M2 Porta v1.0).

## 14. Status and open decisions
Current status, open questions (Q-xx or new), and decisions taken (D-xx).
