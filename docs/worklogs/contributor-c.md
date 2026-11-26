# Work Log — Contributor C (Guest experience, integration and QA)

Name: **Lior Karayev**. GitHub: `Lior-Karayev` (confirmed). AI: Omnigent, coordinating Claude Code, Codex and Antigravity.

One entry per significant task, newest first. Keep entries short; link to PRs instead of copying content. Do not paste whole conversations. For delegated work, name the implementing agent and the reviewing agent.

## Entry template

```markdown
### YYYY-MM-DD · <task title>

| Field | Value |
|---|---|
| Sprint | Sprint N |
| Human contributor | Lior Karayev (C) |
| AI agent used | Omnigent → implementing: … · reviewing: … |
| GitHub Issue | #… |
| Work completed | … |
| Decisions | D-xx (or "none") |
| Problems encountered | … |
| Tests performed | … |
| Commits / PR | <PR link> |
```

## Entries

### 2026-11-26 · PR #2: GitHub identities and the zero-cost policy (PRD v2.2)

| Field | Value |
|---|---|
| Sprint | CP0 |
| Human contributor | Lior Karayev (C) |
| AI agent used | Omnigent (Claude Code, Opus 5.5), implementing. No delegated review (documentation change; scripted consistency checks) |
| Work completed | GitHub accounts recorded (Q-01 resolved, D-24). $0 budget recorded (D-38) in `AGENTS.md`, WORKFLOW §9, the Feature PRD template, the PRD (§7.5, §11.3–11.5, §14, §15, NFR-21, FR-42) and the sprint plan. Paid fallbacks removed (Firebase Blaze, a paid AI plan, Apple account, domain). Free AI API shortlist researched (Mistral, Groq, Gemini, Cloudflare) |
| Decisions | D-38 Confirmed; D-24 and D-32 updated; D-12 and D-18 superseded |
| Problems encountered | Some free-tier facts (Groq retention, card requirement, Mistral structured output) could not be confirmed from official pages and are marked "to check" |
| Tests performed | PDF rebuilt (59 pages), no Mermaid errors, no overflow; repository-wide search for paid-allowing wording; Q-01, D-32 and Q-04 checked across documents |
| Commits / PR | https://github.com/Lior-Karayev/porta/pull/2 |

### 2026-11-26 · PR #2 completion: team decisions, research, PRD v2.1

| Field | Value |
|---|---|
| Sprint | CP0 (before Sprint 1) |
| Human contributor | Lior Karayev (C), who supplied the team decisions |
| AI agent used | Omnigent (Claude Code, Opus 5.5). Implementing: Claude Code. No delegated review (documentation change, proportional review: consistency checks by the implementing agent) |
| GitHub Issue | — (PR #2) |
| Work completed | Names and roles confirmed throughout (D-24). D-30, D-31 and D-32 recorded as approved by Lior; D-29 left Proposed. iOS limitation documented (D-36). Official documentation checked for Flutter platform minimums (D-37), Section 5 products, Firebase versus Supabase (D-34), guest-page hosting (D-35) and deep-link fragment handling (NFR-05). Sprint 1 task estimates, capacity, critical path and fallback added. Usability test plan written. Q-table reworked, with partly answered questions keeping only the open parts. Appendix B corrected. PDF v2.1 rebuilt |
| Decisions | D-24, D-30, D-31, D-32 Confirmed (Lior, 26 Nov); D-36 Confirmed (fact); D-34, D-35, D-37 Proposed; D-29 still Proposed |
| Problems encountered | The GitHub account mapping for Daniel and Avishag can't be verified from the repository, so it is left pending. No hands-on product tests were possible. Several official pages were read through web search summaries, not as full pages |
| Tests performed | PDF rebuilt (57 pages): all 15 sections and both appendices extracted, no Mermaid errors, no text beyond the right margin, changed tables inspected visually; Sprint 1 estimate totals recomputed by script; cross-document grep for names, statuses and stale dates |
| Commits / PR | https://github.com/Lior-Karayev/porta/pull/2 |

### 2026-11-25 · CP0 revision: scope reduction to six features, agent policy, sprint plan, PRD v2.0

| Field | Value |
|---|---|
| Sprint | CP0 (before Sprint 1) |
| Human contributor | Contributor C (Lior), as directed in the CP0 restructuring assignment |
| AI agent used | Omnigent (Claude Code, Opus 5.5) → implementing: Claude Code · reviewing: Codex (technical/consistency), Antigravity (UX), Claude Code subagent (policy/security) |
| GitHub Issue | None (CP0 documentation task) |
| Work completed | `AGENTS.md`, `CLAUDE.md`; team docs (contributors, workflow, GitHub protection); templates (Feature PRD, sprint report, carryover, work logs); review, test and Code Concepts logs; sprint plan; decision log moved to `docs/decisions/` and extended (D-22–D-33); Master PRD revised to v2.0 (six feature groups P-F01–P-F06, new milestones, sprint plan, traceability) and PDF rebuilt; CP0 checklist updated |
| Decisions | D-22–D-33 recorded. The ones given in the assignment are *Confirmed*; agent recommendations are *Proposed* |
| Reviews | 40 findings (3 critical, 26 major, 11 minor); all critical and major fixed (`docs/reviews/CP0_REVISION_REVIEWS.md`) |
| Problems encountered | Repository default branch is `cp0/prd` and `main` has no verifiable protection (`docs/team/GITHUB_PROTECTION.md`). The separate `claude -p` CLI reported exhausted usage credits, so Claude's instruction discovery is unverified (none bought). Codex's sandbox could not start (no user namespaces) and Antigravity's headless mode refused commands, so both reviewed the files pasted into their prompts without tools, and no sandbox or permission safeguard was disabled. Mermaid label bug in Diagram 4, already present in v1.0, fixed |
| Tests performed | PDF rebuilt (55 pages) and checked: all 15 section headings extracted, no Mermaid errors, diagram pages inspected visually; instruction-discovery test for Codex and Antigravity |
| Commits / PR | Branch `cp0/scope-reduction` → PR to `main` (link in the PR itself) |

### 2026-11-21 · CP0: PRD v1.0

| Field | Value |
|---|---|
| Sprint | CP0 |
| Human contributor | Lior (recorded retrospectively from Git history) |
| AI agent used | Omnigent → implementing: Claude · reviewing: Codex (feasibility), Antigravity (UX), Claude (security) |
| GitHub Issue | — |
| Work completed | PRD v0.9 → v1.0 with 27 review findings resolved |
| Decisions | D-01–D-21 |
| Problems encountered | — |
| Tests performed | PDF build and review rounds (`docs/reviews/CP0_REVIEWS.md`) |
| Commits / PR | PR #1 (merged 21 Nov 2026) |
