# Review Log

One entry per review round that matters: PRD revisions, Feature PRDs, and any **deep** review of critical logic (`docs/team/WORKFLOW.md`, Section 5). Light and focused reviews of ordinary changes stay in the PR conversation.

Detailed findings of a round may live in their own file in `docs/reviews/` (for example `CP0_REVIEWS.md`); this log is the index.

## Entry template

```markdown
### R<n> · YYYY-MM-DD · <what was reviewed>

| Field | Value |
|---|---|
| Subject | PR #… / commit … / document |
| Review level | light / focused / deep |
| Implementing agent | … |
| Reviewing agent(s) | … |
| Findings | n (critical / major / minor) — summary or link |
| Resolution | fixed in … / not adopted because … |
| Open after review | … |
```

## Entries

### R2 · 2026-11-25 · CP0 revision: PRD v2.0, agent policy, sprint plan

| Field | Value |
|---|---|
| Subject | Draft commit `3b535a1` on `cp0/scope-reduction` |
| Review level | focused (technical, UX, policy/security) |
| Implementing agent | Claude Code (Opus 5.5) via Omnigent |
| Reviewing agent(s) | Codex (technical), Antigravity (UX), Claude Code subagent (policy/security) |
| Findings | 40 (3 critical, 26 major, 11 minor) — [`CP0_REVISION_REVIEWS.md`](CP0_REVISION_REVIEWS.md) |
| Resolution | All critical and major findings fixed; detail parts of 3 findings deferred to Feature PRDs |
| Open after review | No re-review round was run on the fixes (proportional effort for a documentation checkpoint); Lior's human review is the next gate |

### R1 · 2026-11-21 · CP0: PRD v0.9 → v1.0

| Field | Value |
|---|---|
| Subject | PRD v0.9 (commit d7e7f7f), then v1.0 verification rounds; PR #1 |
| Review level | deep (whole requirements document) |
| Implementing agent | Claude (via Omnigent) |
| Reviewing agent(s) | Codex (technical feasibility), Antigravity (UX), Claude (security) |
| Findings | 27 (1 critical, 19 major, 7 minor) plus 2 new major findings in the verification round — [`CP0_REVIEWS.md`](CP0_REVIEWS.md) |
| Resolution | All resolved in v1.0 / v1.0.1; three suggestions deliberately not adopted (listed in `CP0_REVIEWS.md`) |
| Open after review | None blocking |
