# Porta

Scheduled, controlled guest access to (simulated) community gates. A Flutter/Dart course project, Kinneret College, 2026–27.

**Current checkpoint: CP0 — PRD and planning documentation only.** No application code exists yet. Flutter development starts only after Lior authorises the next checkpoint.

**AI agents:** read [`AGENTS.md`](AGENTS.md) before doing anything. Claude Code loads it through [`CLAUDE.md`](CLAUDE.md).

## Scope (PRD v2.0)

Six major feature groups. Details are in PRD §7.

| ID | Feature group |
|---|---|
| P-F01 | Authentication and user management |
| P-F02 | Permission management |
| P-F03 | Guest invitations and sharing |
| P-F04 | Guest access and simulated gate |
| P-F05 | Activity history and notifications |
| P-F06 | AI-assisted permission creation |

Milestones: **M0** PRD submission 28 Nov 2026 · **M1** first MVP 12 Dec 2026 · **M2** Porta v1.0 30 Jan 2027 (proposed). Work runs in 14-day sprints.

## Repository map

| Path | Contents |
|---|---|
| `AGENTS.md` | Mandatory rules for every AI agent (single source) |
| `CLAUDE.md` | Claude Code entry point; imports `AGENTS.md` |
| `docs/prd/Porta-PRD.pdf` | Submission-ready Master PRD (single PDF) |
| `docs/prd/src/*.html` | PRD source, in parts (diagrams in Mermaid, wireframes in HTML/CSS) |
| `docs/prd/build.sh` | Rebuilds the PDF (needs Google Chrome; loads Mermaid from jsDelivr) |
| `docs/CP0_CHECKLIST.md` | Assignment requirements → PRD coverage |
| `docs/team/` | Contributor registry, workflow, GitHub protection guide |
| `docs/decisions/DECISION_LOG.md` | Confirmed / proposed / open decisions |
| `docs/features/` | Feature PRDs (template now; one per feature before it is built) |
| `docs/sprints/` | Sprint plan, sprint report template, carryover log |
| `docs/worklogs/` | One work log per contributor |
| `docs/reviews/` | Review log and detailed review findings |
| `docs/testing/` | Test reports |
| `docs/learning/` | Code Concepts Index |

## How work is merged

Every change goes through a Pull Request to `main`. Agents open PRs and stop at `READY_FOR_HUMAN_REVIEW`. **Only Lior authorises a merge**, one PR at a time (`AGENTS.md` §4).
