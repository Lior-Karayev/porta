# Porta — Team and Agent Workflow

This document describes **how** the team and its AI agents work. The binding rules are in [`AGENTS.md`](../../AGENTS.md). This file adds procedures and details, and must not contradict it.

## 1. Roles at a glance

- **Three human contributors** (A, B, C), with responsibilities by component: [`CONTRIBUTORS.md`](CONTRIBUTORS.md).
- **AI agents** assist each contributor: Claude Code (A and B); Omnigent coordinating Claude Code, Codex and Antigravity (C).
- **Lior (Contributor C)** is the only person who can authorise a merge into `main`. Lior may review PRs together with ChatGPT; ChatGPT advises, and Lior decides.

## 2. Session start (every agent, every contributor)

1. The agent asks who is directing the session (unless that person already said so in this session).
2. The agent reads `CONTRIBUTORS.md` and identifies the task (feature `P-F0x` or GitHub Issue).
3. If the task is outside the contributor's component, the agent says so and proposes one of:
   - doing it as an approved collaboration (the component owner agrees in the Issue or PR),
   - handing it to the component owner, or
   - recording a reassignment in `CONTRIBUTORS.md` once it is approved.
4. The agent works only within that scope until the task is done or the human changes it.

Identity statements are a coordination safeguard, not authentication. Agents never ask for passwords or tokens.

## 3. Branches, commits and Pull Requests

| Step | Rule |
|---|---|
| Issue | Every task starts from a GitHub Issue that names the feature, the sprint and the responsible contributor. |
| Branch | One branch per task, created from the latest `main`: `<type>/<issue-number>-<short-name>`, e.g. `feat/12-permission-form`, `fix/30-dst-window`, `docs/41-sprint-2-report`. Documentation checkpoints may use `cp<N>/<name>`. |
| Upstream | Push with `git push -u origin <branch>`. A task branch must never track `origin/main`. |
| Commits | Small, focused, with a clear message (`feat:`, `fix:`, `docs:`, `test:`, `chore:`). No unrelated changes. No secrets. |
| PR | Target `main` explicitly (`gh pr create --base main`). Fill in the PR checklist below. Link the Issue (`Closes #12`). |
| Checks | Format, analysis and tests must pass in CI once CI exists (Sprint 1). |
| Review | Proportional review (Section 5). Findings and fixes are recorded in the PR and, for critical logic, in `docs/reviews/REVIEW_LOG.md`. |
| Ready | The agent sets the task status to `READY_FOR_HUMAN_REVIEW`, reports the PR URL, and **stops**. |
| Merge | Only after Lior explicitly authorises that specific PR. The status becomes `MERGED` only when the merge has actually happened. |

**PR checklist** (copy into each PR description):

- [ ] Linked Issue and feature (`P-F0x`)
- [ ] Within the contributor's component, or coordination is recorded
- [ ] Feature PRD acceptance criteria covered by this PR are listed
- [ ] `dart format` / `flutter analyze` / tests pass (or N/A for docs)
- [ ] Documentation updated (work log, Code Concepts Index if relevant, decisions)
- [ ] Review done at the required level (Section 5)
- [ ] Implementing agent and reviewing agent named (delegated work)

## 4. Instruction discovery per tool

Agents do not all read the same files automatically. This is what was **verified on 25 Nov 2026** in this repository:

| Tool | Version checked | Reads `AGENTS.md` by itself? | Entry point configured | Verified how |
|---|---|---|---|---|
| Codex CLI | 0.170.0 | **Yes** (native `AGENTS.md` support) | `AGENTS.md` | Non-interactive run with no tools: Codex quoted the `AGENTS.md` heading from its loaded context |
| Antigravity CLI (`agy`) | 1.5.17 | **Yes** (reads `AGENTS.md` as a rule file) | `AGENTS.md` | Same test: it quoted the heading |
| Claude Code | 2.1.332 | **No** (Claude Code reads `CLAUDE.md`) | `CLAUDE.md`, which imports `AGENTS.md` with `@AGENTS.md` and also says to read it | **Not verified end to end.** The non-interactive test could not run because the Claude Code CLI reported that its usage credits were exhausted. Re-run the test when credits are available (below). |
| Omnigent | — | **Not by itself.** Omnigent runs Claude Code as its harness here, so it gets `AGENTS.md` through `CLAUDE.md`. Omnigent has no project-instruction mechanism of its own that was verified. | via `CLAUDE.md` | Inspection of this session's setup |
| ChatGPT (Lior's PR review) | — | **No.** It sees only what is pasted or linked. | — | Not applicable |

**Known limitations and how to handle them:**

1. **Subagents.** Subagents started by Claude Code (Agent tool), by Codex, or by Omnigent may not load the parent's instructions. Every delegated prompt must either say *"Read `AGENTS.md` in the repository root before starting, and follow it"* or include the rules that apply to the task: scope, no merge, budget, and documentation.
2. **Agents started outside the repository root** may not find `AGENTS.md`. Start them from the repository root, or pass the path.
3. **Claude Code without the import.** If `@AGENTS.md` is not expanded, the text in `CLAUDE.md` still tells Claude Code to read `AGENTS.md` first.
4. **ChatGPT** cannot see repository files. When Lior reviews a PR with ChatGPT, paste the PR diff and the relevant `AGENTS.md` sections.
5. **Do not create more copies** of the rules (for example `GEMINI.md`) unless a tool is shown not to read `AGENTS.md`. A new entry point must only point to `AGENTS.md`.

**How to re-verify** (run from the repository root; should print the first heading of `AGENTS.md`):

```bash
Q='Do not use any tools or read any files. Using only the instructions already loaded into your context, quote the first heading line of the repository file AGENTS.md exactly. If it is not in your context, answer exactly: NOT LOADED.'
claude -p "$Q" --disallowedTools "Read,Bash,Grep,Glob"
codex exec --sandbox read-only "$Q"
agy -p "$Q" --mode plan
```

## 5. Reviews

Review effort is proportional (`AGENTS.md`, Section 9).

| Level | When | What |
|---|---|---|
| **Light** | Small UI change, documentation | Consistency check, relevant tests, Feature PRD alignment. One agent is enough. |
| **Focused** | Ordinary application logic | Targeted tests, API/contract compatibility, a focused review by a second agent if the change is not trivial. |
| **Deep** | Critical logic: authentication, authorisation, invitation tokens, database rules, counters, concurrency, sensitive data | A second agent reviews with a security/concurrency focus. Tests for invalid, expired, suspended, cancelled, exhausted and concurrent cases. Findings logged in `docs/reviews/REVIEW_LOG.md`. |

**Reviewing Contributors A and B (by Omnigent):** check scope, Feature PRD alignment, API compatibility, passing tests, documentation quality and absence of unrelated changes. Do not rewrite their work and do not repeat full reviews. Report problems as PR review comments addressed to the responsible contributor.

**Agent attribution:** for delegated work, the PR description and the work log name the implementing agent and the reviewing agent.

## 6. Testing and Definition of Done

Test layers (introduced from Sprint 1):

| Layer | Owner (primary) | Runs in |
|---|---|---|
| `dart format --set-exit-if-changed`, `flutter analyze` | Everyone | CI on every PR |
| Unit and widget tests | Author of the code | CI |
| Backend tests (rules, validation, counters, concurrency) | Contributor B | CI or local emulator |
| Integration tests (app ↔ backend ↔ guest page) | Contributor C | CI where possible, otherwise scripted locally |
| End-to-end central scenario | Contributor C | Before each milestone |

**Central scenario** (from Sprint 1, automated by Sprint 3): resident creates permission → database stores it → guest receives link → backend validates the opening → simulator responds → opening count and activity history update correctly. Negative variants: invalid link, expired, suspended, cancelled, exhausted, concurrent last opening.

Results of milestone and sprint test runs are recorded in `docs/testing/TEST_REPORTS.md`.

The Definition of Done is in `AGENTS.md`, Section 10. Meeting it allows `READY_FOR_HUMAN_REVIEW`; it never authorises a merge.

## 7. Sprints

- Sprints are **14 days** long. The plan is in [`docs/sprints/SPRINT_PLAN.md`](../sprints/SPRINT_PLAN.md).
- A sprint and a release milestone are different things. Milestones (M0, M1, M2) are delivery dates; some fall inside a sprint. The instructor may set submission deadlines every 7 or 14 days. Record each changed deadline in `DECISION_LOG.md` and update the plan.
- **Start of sprint:** confirm the sprint goal, create or update the Issues, check that the Feature PRDs needed by the sprint exist.
- **During the sprint:** a short weekly sync (async is fine), recorded in the sprint report.
- **End of sprint** (the planned date, never silently extended): sprint report from `SPRINT_TEMPLATE.md`, the code walkthrough, carryover entries for unfinished work, retrospective notes.
- **Unfinished work** is recorded in [`SPRINT_CARRYOVER.md`](../sprints/SPRINT_CARRYOVER.md) with the nine required fields. The team decides on carryover or scope reduction. Earlier sprint outcomes are never erased.

## 8. Documentation duties

| Who | When | What |
|---|---|---|
| Every contributor (with their agent) | Each significant task | Entry in `docs/worklogs/contributor-{a,b,c}.md` |
| Feature coordinator | Before a feature's first implementation task | Feature PRD from `docs/features/FEATURE_PRD_TEMPLATE.md` |
| Author of the code | When a concept is first used | Entry in `docs/learning/CODE_CONCEPTS.md` |
| Contributor C (Omnigent) | End of sprint | Sprint report, walkthrough, carryover, test report |
| Whoever records a decision | When it is made | `docs/decisions/DECISION_LOG.md`, with a human decision maker |

## 9. Budget requests

Any expense (cloud billing plan, Apple developer account, paid AI API, domain, model credits) is raised as a GitHub Issue labelled `budget` with: purpose, estimated cost, benefits, free alternatives, consequences of not purchasing. Nothing is bought, enabled or linked to a billing account until the team approves it and the decision is logged.
