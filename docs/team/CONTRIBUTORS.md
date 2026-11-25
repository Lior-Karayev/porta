# Porta — Contributor Registry

Every AI agent reads this file at session start (`AGENTS.md`, Section 2). Update it whenever responsibilities change, and record the decision in `docs/decisions/DECISION_LOG.md`.

**Status of this registry:** the component allocation below is **provisional** (decision D-24, Proposed). Only Contributor C has been assigned to a named person. The team still has to confirm the assignment of Contributors A and B (open question Q-01).

The team members named in the PRD are Daniel, Lior and Avishag. Surnames have not been provided yet. Do not invent them.

## Contributors

| | Contributor A | Contributor B | Contributor C |
|---|---|---|---|
| **Name** | *Unassigned* (Daniel or Avishag; pending team confirmation) | *Unassigned* (Daniel or Avishag; pending team confirmation) | **Lior** (surname not yet provided) |
| **GitHub username** | *Not confirmed* | *Not confirmed* | *Not confirmed in this registry*¹ |
| **Primary area** | Flutter and UX | Backend and Data | Guest experience, integration and QA |
| **AI development tools** | Claude Code | Claude Code | Omnigent, coordinating Claude Code, Codex and Antigravity |
| **Repository role** | Merge authority: none | Merge authority: none | **Sole merge authority for `main`** (`AGENTS.md`, Section 4) |

¹ The repository owner account is `Lior-Karayev`, and the repository has two more collaborator accounts with write access (`XVortXx`, `avishagyonatan-design`). Following `AGENTS.md`, nobody's identity is inferred from an account name. Each contributor confirms their own username here.

## Responsibilities by component

Responsibility is assigned **by implementation component**, not by exclusive feature ownership. A feature (`P-F01`…`P-F06`) usually involves several contributors. Every contributor must understand the code they write and, at a high level, the complete execution flow of each feature they touch.

### Contributor A — Flutter and UX

- Resident-facing Flutter screens (S-01–S-06, S-08, S-10, S-12, S-13)
- Forms and input validation
- Navigation and state management
- UI-to-backend integration (calling the APIs defined by Contributor B)
- Accessibility and Hebrew right-to-left support (NFR-15, NFR-17)

### Contributor B — Backend and Data

- Authentication and roles (server side)
- Database, data models and security rules
- Backend APIs, including gate-open validation (Diagram 3)
- Atomic counters, idempotency and rate limiting
- AI draft endpoint (server-side proxy for P-F06)
- Backend tests

### Contributor C — Guest experience, integration and QA (Lior)

- Guest invitation page in the browser (W-01, W-02)
- Sharing and QR integration
- Simulated gate (state and simulator view)
- Integration and end-to-end tests
- CI
- Cross-component compatibility (API contracts between A and B)
- Project-wide scope monitoring

## Feature coordination (provisional)

The **human coordinator** of a feature keeps its Feature PRD current and checks that the parts fit together. Coordinating a feature does not mean owning every part of it.

| Feature | Human coordinator (proposed) | Contributing components |
|---|---|---|
| P-F01 Authentication and user management | Contributor B | B (auth, roles, rules) · A (sign-in, join, approval screens) |
| P-F02 Permission management | Contributor B | B (model, validation, counters) · A (forms, list, details) |
| P-F03 Guest invitations and sharing | Contributor C | B (tokens) · A (share sheet, QR screen) · C (link format, QR integration, deep-link spike) |
| P-F04 Guest access and simulated gate | Contributor C | C (guest page, simulator) · B (gate-open endpoint) |
| P-F05 Activity history and notifications | Contributor A | B (events, push sending) · A (activity screen, notification handling) |
| P-F06 AI-assisted permission creation | Contributor A | A (describe screen, draft review) · B (AI proxy, validation) |

## Current GitHub Issues

None have been created yet. Issues are created at the start of Sprint 1 (`docs/sprints/SPRINT_PLAN.md`). List each contributor's open Issues here or link to a filtered Issue view.

## Approved responsibility changes

| Date | Change | Reason | Approved by | Decision ID |
|---|---|---|---|---|
| — | No changes yet | — | — | — |
