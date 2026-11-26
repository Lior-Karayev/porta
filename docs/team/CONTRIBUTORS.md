# Porta — Contributor Registry

Every AI agent reads this file at session start (`AGENTS.md`, Section 2). Update it whenever responsibilities change, and record the decision in `docs/decisions/DECISION_LOG.md`.

**Status of this registry:** names, roles and GitHub accounts are **confirmed** (decision D-24; the accounts were confirmed by Lior Karayev as project coordinator on 26 Nov 2026, so Q-01 is resolved). Do not ask the contributors to confirm them again.

## Contributors

| | Contributor A | Contributor B | Contributor C |
|---|---|---|---|
| **Name** | **Daniel Benfusi** | **Avishag Yonatan** | **Lior Karayev** |
| **GitHub username** | `XVortXx` | `avishagyonatan-design` | `Lior-Karayev` (repository owner) |
| **Primary area** | Flutter and UX | Backend and Data | Guest experience, integration and QA |
| **AI development tools** | Claude Code | Claude Code | Omnigent, using Claude Code, Codex and Antigravity through approved first-party accounts |
| **Repository role** | Merge authority: none | Merge authority: none | **Sole merge authority for `main`** (`AGENTS.md`, Section 4) |

A GitHub account is a coordination fact recorded by the project coordinator. It is still not proof of who is directing an AI session: agents follow the session-start procedure in `AGENTS.md`, Section 2, and never infer the human from the account alone.

| GitHub account | Repository permission | Human owner |
|---|---|---|
| `Lior-Karayev` | admin (owner) | Lior Karayev |
| `XVortXx` | write | Daniel Benfusi |
| `avishagyonatan-design` | write | Avishag Yonatan |

## Responsibilities by component

Responsibility is assigned **by implementation component**, not by exclusive feature ownership. A feature (`P-F01`…`P-F06`) usually involves several contributors. Every contributor must understand the code they write and, at a high level, the complete execution flow of each feature they touch.

### Contributor A — Flutter and UX (Daniel Benfusi)

- Resident-facing Flutter screens (S-01–S-06, S-12, S-13) and the small administrator approval screen S-08 (minimal administration, D-31)
- Forms and input validation
- Navigation and state management
- UI-to-backend integration (calling the APIs defined by Contributor B)
- Accessibility and Hebrew right-to-left support (NFR-15, NFR-17)

### Contributor B — Backend and Data (Avishag Yonatan)

- Authentication and roles (server side)
- Database, data models and security rules
- Backend APIs, including gate-open validation (Diagram 3)
- Atomic counters, idempotency and rate limiting
- AI draft endpoint (server-side proxy for P-F06)
- Backend tests

### Contributor C — Guest experience, integration and QA (Lior Karayev)

- Guest invitation page in the browser (W-01, W-02)
- Sharing and QR integration
- Simulated gate: gate state and the simulator screen S-10 (a Flutter screen built by C, with A reviewing for UI consistency)
- Integration and end-to-end tests
- CI
- Cross-component compatibility (API contracts between A and B)
- Project-wide coordination and scope monitoring
- Usability test coordination (provisional, Q-02)

## Feature coordination

The **human coordinator** of a feature keeps its Feature PRD current and checks that the parts fit together. Coordinating a feature does not mean owning every part of it.

| Feature | Human coordinator (proposed; confirm at Sprint 1 planning) | Contributing components |
|---|---|---|
| P-F01 Authentication and user management | Avishag (B) | B (auth, roles, rules) · A (sign-in, join, approval screens) |
| P-F02 Permission management | Avishag (B) | B (model, validation, counters) · A (forms, list, details) |
| P-F03 Guest invitations and sharing | Lior (C) | B (tokens) · A (share sheet, QR screen) · C (link format, QR integration, deep-link spike) |
| P-F04 Guest access and simulated gate | Lior (C) | C (guest page, simulator) · B (gate-open endpoint) |
| P-F05 Activity history and notifications | Daniel (A) | B (events, push sending) · A (activity screen, notification handling) |
| P-F06 AI-assisted permission creation | Daniel (A) | A (describe screen, draft review) · B (AI proxy, validation) |

## Current GitHub Issues

None have been created yet. Issues are created at the start of Sprint 1 (`docs/sprints/SPRINT_PLAN.md`). List each contributor's open Issues here or link to a filtered Issue view.

## Approved responsibility changes

| Date | Change | Reason | Approved by | Decision ID |
|---|---|---|---|---|
| 2026-11-26 | Roles A, B and C assigned to Daniel Benfusi, Avishag Yonatan and Lior Karayev | Team confirmation of the provisional allocation | Lior (for the team) | D-24 |
| 2026-11-26 | GitHub accounts recorded: `XVortXx` (Daniel), `avishagyonatan-design` (Avishag), `Lior-Karayev` (Lior) | Confirmed by the project coordinator | Lior Karayev | D-24 (Q-01 resolved) |
