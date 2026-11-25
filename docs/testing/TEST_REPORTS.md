# Test Reports

Results of sprint-end and milestone test runs. Each report states what was run, on which build, and what failed. Failing results are recorded as they are. They are never removed or rewritten later.

Test layers, owners and the central scenario are described in `docs/team/WORKFLOW.md`, Section 6. Acceptance criteria live in the Master PRD (Section 9) and in the Feature PRDs.

## Report template

```markdown
### T<n> · YYYY-MM-DD · <Sprint N end / M1 / M2 / ad hoc>

| Field | Value |
|---|---|
| Build | commit … / tag … / PR #… |
| Environment | device(s), OS, browser, backend (emulator / deployed), network profile |
| Run by | contributor + agent |

| Suite / check | Result | Notes |
|---|---|---|
| `dart format --set-exit-if-changed` | pass / fail | |
| `flutter analyze` | pass / fail (n issues) | |
| Unit + widget tests | x / y passed | |
| Backend tests (validation, counters, concurrency) | x / y passed | |
| Integration tests | x / y passed | |
| E2E central scenario (WORKFLOW §6) | pass / fail | |
| Negative cases: invalid · expired · suspended · cancelled · exhausted · concurrent | … | |
| Acceptance criteria demonstrated | AC-…, AC-… | |
| NFR measurements (if scheduled) | NFR-01 p95 = … s | |

**Failures and follow-up:** … (Issue #…)
```

## Reports

*No test runs yet. Development starts in Sprint 1 (29 Nov 2026), after CP0 is approved.*
