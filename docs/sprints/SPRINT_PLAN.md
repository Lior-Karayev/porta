# Porta — Sprint Plan (14-day sprints)

**Status:** **Approved by Lior on 26 Nov 2026 as the current development baseline (decision D-30).** The team may adjust sprint content and future dates during development. Every change is documented, explained, reviewed for its effect on the milestones, and recorded in `docs/decisions/DECISION_LOG.md`. Sprints stay 14 days long unless the team explicitly approves a process change, and an unfinished sprint is never silently extended.

Owners (confirmed, D-24): **A = Daniel Benfusi** (Flutter and UX) · **B = Avishag Yonatan** (backend and data) · **C = Lior Karayev** (guest experience, integration and QA). Administration stays minimal (D-31): no administrator management screens are planned beyond approving residents (S-08) and the simulator (S-10).

Source of scope: Master PRD v2.1, Section 7 (six feature groups P-F01–P-F06). Rules for unfinished work: `SPRINT_CARRYOVER.md`.

## 1. Calendar, milestones and deadlines

| Sprint | Dates | Milestone inside the sprint |
|---|---|---|
| — (CP0) | to 28 Nov 2026 | **M0 · Master PRD submission, Sat 28 Nov 2026** |
| Sprint 1 | Sun 29 Nov – Sat 12 Dec 2026 | **M1 · First MVP submission, Sat 12 Dec 2026** |
| Sprint 2 | Sun 13 Dec – Sat 26 Dec 2026 | — |
| Sprint 3 | Sun 27 Dec 2026 – Sat 9 Jan 2027 | — |
| Sprint 4 | Sun 10 Jan – Sat 23 Jan 2027 | **Feature freeze, Sat 23 Jan 2027** |
| Sprint 5 | Sun 24 Jan – Sat 6 Feb 2027 | **M2 · Porta v1.0, Sat 30 Jan 2027** (proposed, not instructor-confirmed) |

- A **sprint** is a 14-day planning and review cycle. A **milestone** is a delivery date. They are tracked separately.
- **All milestone dates fall on a Saturday.** The internal target is the **Thursday before** (26 Nov, 10 Dec, 28 Jan), leaving a buffer for the PDF, the demo recording or the release build.
- The instructor may set submission deadlines every 7 or 14 days. Each new or changed deadline is recorded in `docs/decisions/DECISION_LOG.md`, and this table is updated.
- **Nothing finished after 30 Jan 2027 counts toward Porta v1.0.** Release-critical work is therefore planned for Sprints 1–4. Sprint 5 is for stabilisation, the release and post-release work only.
- January is exam season (R-01). Sprints 4 and 5 are deliberately the lightest in new features.

## 2. Planning assumptions

- **Capacity (planning assumption, not a confirmed availability commitment):** about **8–10 hours per contributor per week**, so **16–20 hours per contributor per sprint**, alongside other courses. Each contributor states their real availability at sprint planning, and the plan is re-checked against it.
- **Effort estimates** are Omnigent's first estimates in hours. They include working with AI agents, reviewing, testing and the required documentation. The owners re-estimate at each sprint planning.
- **Every feature part needs an approved Feature PRD before coding starts.** A Feature PRD is approved when its coordinator has written it, at least one other contributor whose component it touches has reviewed it, and Lior has merged it. It may cover only the part needed for the current sprint (a "slice-scope" Feature PRD) and is extended in later sprints.
- AI agents speed up implementation but not learning, integration or testing. The plan therefore reserves time for review, tests and walkthroughs in every sprint.
- **End-to-end increments:** every sprint ends with something that runs from the resident app through the backend to the guest page or simulator. No component stays disconnected for a whole sprint.
- **Critical logic first:** gate-open validation, the atomic counter and token handling are built in Sprints 1–2. That leaves two sprints to find concurrency and time-zone bugs.
- **Two blocking decisions** must be made early: the backend (Q-09) by **Tue 1 Dec 2026**, and the AI provider and cost (Q-04) by **Sat 26 Dec 2026**.

## 3. Feature delivery overview

| Feature | S1 | S2 | S3 | S4 | S5 |
|---|---|---|---|---|---|
| P-F01 Authentication and user management | Sign-in with seeded users | Sign-up, join code, approval, roles enforced | — | Hardening | Fixes only |
| P-F02 Permission management | One-time permission, stored, basic checks | Recurring, limits, suspend / resume / cancel, status, list, details | — | Hardening, DST tests | Fixes only |
| P-F03 Guest invitations and sharing | Link generated and copied | Native share sheet with details | QR; deep-link spike (Could) | — | Fixes only |
| P-F04 Guest access and simulated gate | Minimal guest page and simulator | All guest states, rate limiting | Live simulator polish | Performance (NFR-01/02) | Fixes only |
| P-F05 Activity history and notifications | Events recorded (receipts) | Events for every check branch | Activity screen S-06, rate-limit summaries, push (Should) | — | Fixes only |
| P-F06 AI-assisted permission creation | — | Provider decision (Q-04) | Draft endpoint and describe screen | Review, validation, fallback, evaluation | Fixes only |

---

## 4. Sprint 1 — 29 Nov to 12 Dec 2026 · M1 First MVP

**Sprint goal:** a deployed vertical slice. A demo resident creates a one-time permission, it is stored, a link is generated, a guest opens it in a browser, the backend validates it, and the simulated gate opens or rejects.

| # | Task | Feature | Owner | AI support | Depends on | Est. hours (A / B / C) |
|---|---|---|---|---|---|---|
| S1-01 | Sprint planning: state real availability, re-estimate this table, create the GitHub Issues. Daniel and Avishag confirm their GitHub accounts (Q-01). | — | All (C leads) | Omnigent drafts Issues | CP0 merged | 1 / 1 / 2 |
| S1-02 | **Decide the backend (Q-09) by Tue 1 Dec**, starting from the recommendation in PRD §11.3 (D-34). No billing account without approval. | — | B (proposal), team (decision) | Codex: check the recommendation | — | 0 / 1 / 1 |
| S1-03 | Decide the guest-page technology and link domain (Q-14, Q-15) by Tue 1 Dec, starting from D-35. | P-F04 | C | — | S1-02 | 0 / 0 / 1 |
| S1-04 | **Slice-scope Feature PRDs, approved by Wed 2 Dec, before the coding tasks that use them** (five, one per feature group touched by M1): P-F01 (demo sign-in) and P-F02 (one-time permission) by B; P-F03 (link) and P-F04 (guest page, gate-open function) by C; P-F05 (event recording) by A | P-F01–P-F05 | B, C, A | Claude Code | S1-01, S1-02 | 1 / 2 / 2 |
| S1-05 | Flutter project skeleton, folder structure, linting (A). Minimal CI running `dart format`, `flutter analyze` and the tests on every PR (C). | — | A, C | Claude Code, Codex | S1-01 | 3 / 0 / 2 |
| S1-05b | Seed script (one community, one gate, demo users, one already-cancelled permission for the M1 test) and deployment of the backend and guest page | — | C | Claude Code | S1-02, S1-06 | 0 / 0 / 3 |
| S1-06 | Data model and security rules for Community, User, Gate, Permission, Invitation, AccessEvent (no recurrence yet) | P-F01, P-F02 | B | Claude Code | S1-04 | 0 / 5 / 0 |
| S1-07 | Sign-in for seeded demo users; session persists (part of FR-01). Uses the backend's built-in authentication, with no custom auth code | P-F01 | A (screen and wiring), B (rules) | Claude Code | S1-04, S1-06 | 2 / 1 / 0 |
| S1-08 | Create one-time permission: form (S-03, one-time only) and backend create with validation and idempotency (FR-06, FR-16) | P-F02 | A (form), B (backend) | Claude Code | S1-04, S1-06 | 4 / 3 / 0 |
| S1-09 | Invitation token (≥ 128-bit, stored as digest) and link; copy link from S-05 (FR-15) | P-F03 | B (token), A (copy UI) | Claude Code | S1-08 | 1 / 2 / 0 |
| S1-10 | Gate-open function as **one atomic transaction**: token check, cancelled, time window, limit, counter + 1, gate open-until, receipt event with same-request-ID replay, bounded conflict retry (Diagram 3 checks 1, 2, 5, 6, 8, 9) | P-F04, P-F02, P-F05 | B | Claude Code; **deep review by Codex** | S1-04, S1-06 | 0 / 6 / 0 |
| S1-11 | Minimal guest page W-01 / W-02: details, "Open gate", granted / denied result | P-F04 | C | Omnigent → Codex or Claude Code | S1-03, S1-10 | 0 / 0 / 5 |
| S1-12 | Minimal gate simulator S-10 (gate OPEN for 5 s, last event) | P-F04 | C (see rebalancing below) | Omnigent → Claude Code | S1-10 | 0 / 0 / 3 |
| S1-13 | Scripted E2E test of the slice, including invalid link, expired, exhausted, the seeded cancelled permission, same-ID retry, and two simultaneous last-opening requests. C writes the gate-open function's test cases with B | — | C (B advises) | Codex | S1-08–S1-12 | 0 / 1 / 4 |
| S1-14 | M1 submission package: demo script, short recording or live demo, README update; internal target **Thu 10 Dec** | — | C (with A, B) | Omnigent | S1-13 | 1 / 1 / 2 |
| S1-15 | Sprint documentation: work logs, first Code Concepts entries, Sprint 1 report and walkthrough, test report T1 | — | All | Claude Code | — | 1 / 1 / 2 |
| | **Total (first estimate)** | | | | | **14 / 24 / 27** |

**Deliverables:** deployed slice, demo script, minimal CI, seed script, **five slice-scope Feature PRDs** (P-F01–P-F05, approved before coding; the full Feature PRDs follow in S2-01 and S3-01), first Code Concepts entries, Sprint 1 report.

**Acceptance criteria (M1):**

- A seeded resident (or demo user) signs in and creates a one-time permission. It appears in the database with `usedOpenings = 0`.
- The copied link opens W-01 in Chrome on Android, without registration.
- "Open gate" inside the window with openings left → granted; S-10 shows OPEN within 2 s; `usedOpenings` + 1; a GRANTED event is stored.
- The same link after the limit is used → `EXHAUSTED`; after the end time → `EXPIRED`; the seeded cancelled permission → `CANCELLED`; a made-up link → W-02 (`INVALID_LINK`).
- Retrying a request with the same request ID returns the original result and counts nothing.
- Two simultaneous requests on the last opening → exactly one grant (AC-08.4).

**Integration tests:** app → backend create; guest page → gate-open function; function → simulator state; E2E slice script.

**Documentation:** five slice-scope Feature PRDs, decisions Q-09 / Q-14 / Q-15 recorded, work logs, Code Concepts entries, Sprint 1 report and walkthrough, test report T1.

### Sprint 1 capacity and critical path

**Critical path (calendar):** S1-02 backend decision (Tue 1 Dec) → S1-04 Feature PRDs approved (Wed 2 Dec) → S1-06 data model (Fri 4 Dec) → S1-10 gate-open function (Sun 6 Dec) → S1-11 guest page connected (Tue 8 Dec) → S1-13 E2E test green (Wed 9 Dec) → S1-14 M1 package (Thu 10 Dec). That leaves two days of buffer before Sat 12 Dec. S1-08 (create form) runs in parallel with S1-10 once S1-06 is done.

**Overload assessment:** the first estimates are **A 14 h, B 24 h, C 27 h, total 65 h**, against an assumed **16–20 h per person (48–60 h total)**. As first planned, **Sprint 1 is overloaded**: B by about 4–8 h, C by about 7–11 h, and the team by about 5–17 h. A has some spare capacity.

**Proposed rebalancing** (each cross-component item needs the owner's agreement, recorded in `CONTRIBUTORS.md` as an approved collaboration):

| Change | Effect |
|---|---|
| Daniel (A) builds the Flutter simulator screen S-10 to Lior's (C) specification. C keeps ownership of the simulated gate state. | A +3 h · C −3 h |
| Daniel (A) prepares the demo recording and README part of S1-14 | A +1 h · C −1 h |
| The Sprint 1 CI runs only format, analysis and tests. No deployment pipeline yet. | already in the estimate |
| **After rebalancing** | **A 18 h · B 24 h · C 23 h (total unchanged, 65 h)** |

**Even after rebalancing, B and C remain about 3–8 h over the assumed capacity.** The team must confirm real availability at Sprint 1 planning (S1-01). If it is not enough, the fallback below applies, in order, and every step is recorded as a carryover with a team decision:

1. **Demo sign-in only:** M1 allows "a resident or demo user", so a single seeded demo account is signed in with the backend's standard sign-in, and S1-07's screen work moves to Sprint 2 (saves A 2 h, B 1 h).
2. **Simulator reduced** to one gate tile with OPEN/CLOSED and the last event (saves about 1–2 h).
3. **Concurrency test in Sprint 2:** the two-simultaneous-requests E2E case moves to S2-09. The transaction design itself is not changed (saves C about 1 h).
4. If the gate-open function (S1-10) is still not running on **Sun 6 Dec**, the team decides whether M1 is shown with fewer checks (token, cancelled, time window and limit are the minimum). The create form (S1-08) stays, because creating a permission is step 1 of the M1 scenario.

Validation, security and the M1 scenario's six steps are never cut.

**Later sprints (rough load, re-estimated at each sprint planning):** Sprint 2 is B-heavy (P-F01 and P-F02 rules, recurrence, lifecycle) and is planned at about A 16 h / B 20 h / C 18 h, with C writing the Diagram 3 test suite to relieve B. Sprints 3 and 4 are balanced, at about 15–20 h each. Sprint 5 is light before 30 Jan (regression and release-blocking fixes only).

**Risks:** the backend decision is late (blocks everything; mitigation: decide by 1 Dec, prototype against the local emulator meanwhile). Setup problems with Flutter, emulators or deployment (mitigation: C sets up CI and deployment early). The M1 date is on a Saturday (internal target Thursday 10 Dec).

---

## 5. Sprint 2 — 13 to 26 Dec 2026 · Permission core and accounts

**Sprint goal:** a real resident can sign up, join and be approved. They can then create one-time and recurring permissions and suspend, resume or cancel them. Every rule is enforced by the backend, and the guest sees a clear reason for every denial.

| # | Task | Feature | Owner | AI support | Depends on |
|---|---|---|---|---|---|
| S2-01 | Feature PRDs completed for the Sprint 2 scope: P-F01, P-F02, P-F03 (sharing), P-F04 (all states, rate limiting); written in the first two days, before the tasks below start | P-F01–P-F04 | B, C, A | Claude Code | — |
| S2-02 | Sign-up, sign-out, join with community code, pending / rejected screens (FR-01, FR-02, S-01) | P-F01 | A (UI), B (backend) | Claude Code | S1-07 |
| S2-03 | Administrator: approve or reject pending residents (FR-05, S-08); role checks on every server operation (FR-03); join-code rate limit | P-F01 | B (rules), A (S-08) | Claude Code; **deep review by Codex** | S2-02 |
| S2-04 | Recurring permissions: weekdays, daily window, date range, community time zone, DST rules (FR-07) | P-F02 | B (rules), A (form) | Claude Code | S1-08 |
| S2-05 | Suspend, resume, cancel; derived status (FR-10, FR-11, FR-13); full check order including `SUSPENDED`, `NOT_STARTED`, `OUTSIDE_HOURS`, `GATE_INACTIVE`, `GATE_NOT_ALLOWED` | P-F02 | B (backend), A (S-04 actions) | Claude Code; **deep review by Codex** | S1-10 |
| S2-06 | Permission list with filters and details screen (FR-14, S-02, S-04) | P-F02 | A | Claude Code | S2-05 |
| S2-07 | Native share sheet with the guest-facing summary (FR-16, S-05) | P-F03 | A | Claude Code | S1-09 |
| S2-08 | Guest page: all states (ready, opening…, success countdown, reason with guidance, check again); retry with the same request ID; rate limiting (FR-19–FR-21, NFR-06) | P-F04 | C (page), B (rate limiting) | Omnigent → Codex | S2-05 |
| S2-09 | Backend test suite for every branch of Diagram 3 built so far, including concurrency, retries and DST boundaries (NFR-18, G2). Rate-limit **summary** records come in S3-04 and are added to the suite then | P-F02, P-F04 | C (tests, with B), B (fixes) | Codex | S2-03, S2-04, S2-05, S2-08 |
| S2-10 | Integration test: lifecycle (create → grant → suspend → deny → resume → grant → cancel → deny) | — | C | Codex | S2-05, S2-08 |

**Deliverables:** P-F01 and P-F02 feature-complete; guest page complete; validation test suite; Sprint 2 report.

**Acceptance criteria:** the US-01, US-02, US-03, US-04, US-08, US-10 and US-14 criteria in the Master PRD pass (US-14 = account creation and sign-in). The Diagram 3 test suite has at least 25 scenarios and zero incorrect grants.

**Integration tests:** lifecycle test (S2-10); a pending user calling the server directly is rejected (AC-10.2); E2E slice still green.

**Documentation:** three Feature PRDs, decision log, Code Concepts (state management, async, transactions, error handling), Sprint 2 report and walkthrough, test report T2.

**Risks:** time-zone and DST bugs (R-07; mitigation: server-side only, boundary tests). Role rules are wrong (mitigation: deep review). End-of-year holidays reduce capacity (mitigation: the Sprint 1 capacity check). **Decision Q-04 (AI provider and cost) due Sat 26 Dec.**

---

## 6. Sprint 3 — 27 Dec 2026 to 9 Jan 2027 · Sharing, history, notifications, AI groundwork

**Sprint goal:** a resident can share by QR, see the full activity history and, where supported, get a push notification. The first AI draft works end to end behind a feature switch.

| # | Task | Feature | Owner | AI support | Depends on |
|---|---|---|---|---|---|
| S3-01 | Feature PRDs completed for the Sprint 3 scope: P-F03 (QR, deep-link spike), P-F05 (history, push), P-F06 (AI), before the tasks below | P-F03, P-F05, P-F06 | C, A | Claude Code | Q-04 decided |
| S3-02 | QR code for the invitation link, on screen and in the share flow (FR-18) | P-F03 | A (UI), C (scan test on two phones) | Claude Code | S2-07 |
| S3-03 | **Spike (Could):** App Links / Universal Links feasibility (FR-22). Stop at the time box (2 days); defer if risky (D-27). | P-F03 | C | Codex | S1-03 |
| S3-04 | Activity history: event recording incl. rate-limit summaries (FR-26); resident activity screen S-06 with filters (FR-27) | P-F05 | B (events), A (S-06) | Claude Code | S2-05 |
| S3-05 | Push notification on a granted opening, after commit (FR-29), with per-permission toggle; app works fully without push (AC-06.2) | P-F05 | B (sending), A (handling, S-12 toggle) | Claude Code | S3-04 |
| S3-06 | AI draft endpoint (server-side proxy, no key in the app): input limits, strict output schema, timeout 8 s, per-user daily cap (FR-35, NFR-21) | P-F06 | B | Claude Code; **deep review by Codex** (data sent out, keys, cost cap) | Q-04 approved |
| S3-07 | Describe-in-words screen S-13 → draft opens in the regular form S-03 with flagged fields (FR-35, FR-41) | P-F06 | A | Claude Code | S3-06 |
| S3-08 | Automated E2E central scenario (WORKFLOW §6) including history and counter checks | — | C | Codex | S3-04 |

**Deliverables:** P-F03 and P-F05 feature-complete; AI draft working behind a switch; central E2E test automated; Sprint 3 report.

**Acceptance criteria:** US-05, US-06 and US-07 criteria pass; AC-13.1 passes on the test sentences; push AC-06.2a measured on a test Android device (Should).

**Integration tests:** central E2E scenario (automated); notification after commit only; AI unavailable → manual form with text preserved (AC-13.2).

**Documentation:** three Feature PRDs, decision log (Q-04 outcome, deep-link outcome), Code Concepts (HTTP requests, JSON parsing, mocking), Sprint 3 report and walkthrough, test report T3.

**Risks:** no approved AI provider by 26 Dec (R-14; mitigation: see Section 9). Push setup on iOS needs a paid account (R-04; Android only). Deep links take longer than the time box (defer; the web fallback works for everyone).

---

## 7. Sprint 4 — 10 to 23 Jan 2027 · AI completion, quality and feature freeze

**Sprint goal:** P-F06 is complete and safe, all six features pass their acceptance criteria, and the product has been tested by real users, for security and for accessibility. **Feature freeze on Sat 23 Jan**: after it, only fixes.

| # | Task | Feature | Owner | AI support | Depends on |
|---|---|---|---|---|---|
| S4-01 | AI draft: confirmation, server-side re-validation, out-of-range values flagged, manual fallback, cap reached → manual (FR-41, FR-42, AC-13.2–13.5) | P-F06 | A (UI), B (validation) | Claude Code | S3-06, S3-07 |
| S4-02 | AI evaluation: 20 Hebrew and English test sentences, field accuracy measured (G8) | P-F06 | C | Codex | S4-01 |
| S4-03 | Hebrew RTL and accessibility pass on all screens (NFR-15, NFR-17); W-01 live region | — | A (app), C (guest page) | Antigravity (UX review) | — |
| S4-04 | Security review of critical logic: auth, roles, tokens, rules, counter, AI proxy (G6) | — | B (fixes), C (coordination) | **Deep review: Codex + Claude Code** | — |
| S4-05 | Performance measurements NFR-01 / NFR-02 / NFR-03 (G5) | P-F04 | C | Codex | — |
| S4-06 | Usability test with at least 5 participants: G3, G4, G7 (SUS) | — | All (C coordinates) | Antigravity (script review) | S4-03 |
| S4-07 | Full acceptance run of all Must criteria (G1); bug list triaged | — | C | Omnigent | S4-01–S4-05 |
| S4-08 | Fix the bugs found, highest severity first | — | Component owners | Claude Code, Codex | S4-07 |

**Deliverables:** all six features complete; security review report; usability test results; acceptance run report; feature freeze.

**Acceptance criteria:** G1 (100% of Must ACs pass), G2 (0 incorrect grants), G6 (0 open critical/high findings) and AC-13.1–13.5. Any gap is listed with an owner and must be closed in Sprint 5 before the release, or removed from v1.0 by an approved scope change.

**Integration tests:** full central scenario plus negative variants; AI draft → save → guest opens.

**Documentation:** Feature PRD statuses updated, review log (security review), test report T4 (acceptance, NFR measurements, usability), Sprint 4 report and walkthrough.

**Risks:** exam season reduces capacity (R-01; mitigation: no new features after this sprint, cut Should and Could items first). Usability participants are hard to find (recruit in Sprint 3).

---

## 8. Sprint 5 — 24 Jan to 6 Feb 2027 · Release Porta v1.0 (M2, 30 Jan)

**Sprint goal:** release a stable Porta v1.0 on 30 Jan 2027, then close the project documentation.

**Before the release (24–28 Jan, internal target Thu 28 Jan):**

| # | Task | Owner | AI support |
|---|---|---|---|
| S5-01 | Regression run of the central scenario and all negative cases on the release build | C | Codex |
| S5-02 | Fix only release-blocking bugs (no new features) | Component owners | Claude Code |
| S5-03 | Release build, demo environment rehearsal (seed restore ≤ 15 min, NFR-13), release notes | C (with B) | Omnigent |
| S5-04 | Final walkthrough of the codebase for exam preparation; Code Concepts Index complete | All | Claude Code |
| S5-05 | **M2 · Porta v1.0, Sat 30 Jan 2027.** The release PR is merged only after Lior authorises it. | Lior | — |

**After the release (31 Jan – 6 Feb):** sprint and project retrospective, v1.0.x fixes if needed (recorded separately, they do not change what v1.0 contained), final documentation, carryover log closed out with team decisions. **Work in this period does not count toward v1.0.**

**Acceptance criteria (release gate):** the release build passes the S5-01 regression **and** every Must acceptance criterion (G1), with 0 incorrect grants (G2) and 0 open critical or high security findings (G6). Anything not met is either fixed before 30 Jan or removed from v1.0 by an approved scope change, recorded in the decision log. Release notes list every feature and its status honestly, including anything descoped.

**Risks:** an instructor deadline earlier than 30 Jan (Q-16; mitigation: feature freeze already on 23 Jan). A last-minute critical bug (mitigation: the 23 Jan freeze leaves a week).

---

## 9. Contingency and scope protection

- **Cut order if time runs out** (cut from the top first; never cut validation, security or tests). Every cut is a team decision recorded in the decision log; cutting the QR code (a Must) is an approved scope change that also updates FR-18, US-05 and the G1 baseline:
  1. Deep links (FR-22, Could)
  2. Push notifications (FR-29, Should); the activity log remains
  3. Password reset by email (Could)
  4. English UI (Could)
  5. QR code (FR-18). P-F03 still has native sharing.
- **If no AI provider is approved by 26 Dec (Q-04):** the team chooses between (a) a provider's free tier that meets the privacy limits in PRD §11.4, (b) an approved paid plan within a stated budget, or (c) descoping P-F06 by team decision. Porta then demonstrates five significant features (P-F01–P-F05), which still meets the instructor's minimum of five. This choice is recorded as a decision. It is never made silently.
- Every cut or carryover is recorded in `SPRINT_CARRYOVER.md` and the decision log.
