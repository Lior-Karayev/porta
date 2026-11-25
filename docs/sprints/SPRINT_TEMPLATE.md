# Sprint Report Template

Copy to `docs/sprints/sprint-N.md` at the start of each sprint, fill in sections 1–3 at the start, and complete sections 4–9 on the sprint's last day. **The sprint ends on its planned date.** Do not extend it, and do not mark unfinished work as complete.

---

# Sprint N — <dates>

## 1. Sprint goal
One sentence, copied from `SPRINT_PLAN.md` (or the revised goal agreed at sprint start, with the reason).

## 2. Committed work

| Issue | Feature | Task | Contributor | AI support | Depends on |
|---|---|---|---|---|---|
| #… | P-F0x | … | A / B / C | Claude Code / Codex / Antigravity | #… |

## 3. Milestone and deadlines in this sprint
Milestones (M0/M1/M2) and instructor submission dates that fall inside this sprint.

## 4. Outcome

| Issue | Status at sprint end | PR | Notes |
|---|---|---|---|
| #… | `DONE` · `READY_FOR_HUMAN_REVIEW` · `IN_PROGRESS` · `NOT_STARTED` · `DROPPED` | #… | … |

Every commitment not `DONE` (merged and meeting the Definition of Done) gets an entry in `SPRINT_CARRYOVER.md`.

## 5. Acceptance and integration tests
Which acceptance criteria were demonstrated, which integration and E2E tests ran, and the result. Link the entry in `docs/testing/TEST_REPORTS.md`.

## 6. Code walkthrough
Grounded in the code merged this sprint. Never invent files or code.

- **Important changes:** …
- **Main classes and functions:** `path/to/file.dart` — `ClassName.method()` — what it does
- **Data flow:** from the user action to the database and back, for the main scenario of this sprint
- **Programming concepts introduced:** (and added to `docs/learning/CODE_CONCEPTS.md`)
- **Important technical decisions:** D-xx …
- **Five possible exam questions** (each answerable from the actual code):
  1. …
  2. …
  3. …
  4. …
  5. …

## 7. Documentation updated
Feature PRDs, decision log, work logs, Code Concepts Index, test report.

## 8. Risks and problems
New or changed risks (R-xx), blockers met, and what was done.

## 9. Retrospective
What went well · what to change · one concrete action for the next sprint.
