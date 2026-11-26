# CP0 — Assignment Requirements Checklist

Sources:

- The instructor assignment "מטלה: מסמך דרישות מוצר (PRD)" (K. Zoabi, Kinneret College, 2026–27), 6 pages.
- The instructor's clarification of the course requirements, relayed by Lior Karayev in Nov 2026 (no written source available to the authors).
- Lior Karayev's decisions of 26 Nov 2026 (D-24 incl. GitHub accounts, D-30, D-31, D-32, D-36) and the team's zero-cost decision (D-38).
- The team's CP0 restructuring assignment (25 Nov 2026).

The table below shows every mandatory item and where **PRD v2.2** (`docs/prd/Porta-PRD.pdf`) covers it.

## Deliverable
| # | Requirement | Where | Status |
|---|---|---|---|
| D1 | One complete PRD per team, single PDF, submitted in Moodle | `docs/prd/Porta-PRD.pdf` (v2.2) | ✅ PDF ready. The team uploads it to Moodle (M0, 28 Nov 2026) |
| D2 | Team member details, app characterisation, relevant diagrams and sketches | §1, §2–13, Diagrams 1–8 | ✅ |
| D3 | Full product characterisation **and** a clear first version (MVP) | §7.1 (six groups), §7.2 (first MVP = M1 slice; Porta v1.0 = M2), §7.3–7.4 | ✅ |

## Course requirements clarified by the instructor
| # | Requirement | Where | Status |
|---|---|---|---|
| C1 | At least five significant technical features (database, device capabilities, APIs, authentication, …) | §7.1: six feature groups P-F01–P-F06, each with its significant technical capability | ✅ Six planned. If P-F06 is descoped by team decision, five remain (§7.2, §7.5) |
| C2 | Each implemented feature has its own Feature PRD | `docs/features/FEATURE_PRD_TEMPLATE.md`; one Feature PRD per group, scheduled before implementation (`docs/sprints/SPRINT_PLAN.md`) | ✅ Template ready. The Feature PRDs themselves are written in Sprints 1–3, as planned |
| C3 | Agile development, 14-day sprints; sprint ≠ submission milestone | §15.1–15.2, Diagram 8, `docs/sprints/` | ✅ |
| C4 | Instructor deadlines may be every 7 or 14 days | §15 intro, R-16, Q-12 | ⚠️ Exact dates still to be confirmed (Q-12, Q-16) |

## The 15 sections, in order
| # | Section | Required contents | Where | Status |
|---|---|---|---|---|
| 1 | Project details & team | App name, members, initial responsibility; tip: version + date | §1, cover, revision history | ✅ Full names and confirmed roles (D-24): Daniel Benfusi (A), Avishag Yonatan (B), Lior Karayev (C). GitHub accounts confirmed (Q-01 resolved) |
| 2 | Summary & vision | What it does (short), goal & value, full-product vision | §2 | ✅ |
| 3 | Problem & need | Who suffers & from what; current coping & what fails; why needed & evidence; problem described without the app | §3 | ✅ (no research yet — stated explicitly, Q-02) |
| 4 | Audience & user types | Characteristics, needs, roles, allowed / not allowed per type | §4 table + Diagram 1 | ✅ |
| 5 | Existing solutions & differentiation | Similar apps/services, what's missing, our advantage; tip: comparison table | §5 two tables | ✅ Example products checked against official documentation (26 Nov 2026); no hands-on test (Q-03) |
| 6 | Goals & success metrics | Goal, metric, numeric target, timeframe | §6 (G1–G9) | ✅ |
| 7 | Scope & prioritisation | All capabilities; MVP; later; explicitly out of scope; MoSCoW tip | §7.1–7.6 (incl. old → new mapping) | ✅ six groups; all 21 v1.0 capabilities mapped |
| 8 | Functional requirements | ID, clear description, user type, priority; testable, no tech names | §8 (grouped by P-F01–P-F06) | ✅ |
| 9 | User stories & scenarios | As a/I want/so that; Given/When/Then; happy path, errors, edge cases; link to FR | §9 US-01–US-11, US-13, US-14 (H/E/X tags) + Diagram 3 | ✅ |
| 10 | Screens & UX | Screen, purpose, actions, navigation; **wireframes mandatory** | §10 table, Diagram 4, Wireframes 5a–6b | ✅ |
| 11 | Data & external interfaces | Stored data, entities & relations (ERD), external services/APIs; AI: input/output/failure | §11.1–11.4, Diagram 7 | ✅ |
| 12 | Platforms & device capabilities | Android/iOS, screen sizes, camera/location/notifications/local storage — why + permission denied | §12 | ✅ Android verified platform; iOS a target with no test environment (D-36); minimum versions checked against Flutter docs (D-37) |
| 13 | Non-functional requirements | Performance, security, privacy, accessibility, reliability, usability, weak/no connection | §13 NFR-01–NFR-22 | ✅ |
| 14 | Assumptions, constraints, dependencies, risks | Constraints, assumptions, dependencies, risk + mitigation | §14 (A-01–A-12, R-01–R-17) | ✅ |
| 15 | Milestones & open questions | Stage, what is done, expected output; open questions list | §15.1–15.3 + Diagram 8 | ✅ |

## Diagrams (each needs a title, a short explanation, and consistency with the text)
| Diagram | Where | Title | Explanation | IDs consistent |
|---|---|---|---|---|
| Use Case (for §4, §8) | Diagram 1 | ✅ | ✅ | ✅ (labelled with P-Fxx and FR) |
| Process diagram (for §9) | Diagram 3 (+ lifecycle Diagram 2) | ✅ | ✅ | ✅ |
| User Flow (for §9, §10) | Diagram 4 | ✅ | ✅ | ✅ (wizard removed, S-13 added) |
| Wireframes (**mandatory**, §10) | Diagrams 5a, 5b, 6a, 6b | ✅ | ✅ | ✅ (S-13 replaces S-07; S-08 approvals only) |
| ERD (for §11) | Diagram 7 | ✅ | ✅ | ✅ (one gate per permission; E-13 added) |
| Timeline (for §15) | Diagram 8 | ✅ | ✅ | ✅ (sprints + M0/M1/M2) |

## Pre-submission checklist (from the assignment, page 6)
- [x] App name, team member names and responsibility split at the start — full names and confirmed roles (D-24)
- [x] All 15 sections present, in order
- [x] Happy path, error states and edge cases covered (§9 H/E/X)
- [x] Wireframes of the main screens attached
- [x] Every diagram has a title + short explanation and matches the text
- [x] Non-relevant parts marked with a short explanation (camera/location in §12 marked "No" with reasons)
- [x] MVP clearly defined, plus what is not included (§7.2, §7.4, §7.6)
- [x] Every FR has ID, description, user type and priority
- [x] User stories have testable acceptance criteria
- [x] NFRs address weak/no connection (NFR-14)
- [x] Identical names and IDs across the document (Appendix A traceability; retired IDs listed in §7.6)
- [x] Sources cited (Appendix B)
- [x] Saved as one PDF, ready for Moodle

## Team process requirements (CP0 restructuring)
| Requirement | Where | Status |
|---|---|---|
| Shared rules for all AI agents | `AGENTS.md` | ✅ |
| Claude Code directed to the shared rules | `CLAUDE.md` (`@AGENTS.md` import) | ✅ configured · ⚠️ discovery not verified end-to-end (Claude CLI out of credits; `docs/team/WORKFLOW.md` §4) |
| Instruction discovery checked per tool | `docs/team/WORKFLOW.md` §4 | ✅ Codex and Antigravity verified |
| Human identity and ownership procedure | `AGENTS.md` §2, `docs/team/CONTRIBUTORS.md` | ✅ |
| No autonomous merging; only Lior authorises merges | `AGENTS.md` §4, D-26 | ✅ policy · ⚠️ GitHub protection **not active** (`docs/team/GITHUB_PROTECTION.md`, Q-17) |
| Sprint plan, carryover procedure | `docs/sprints/` | ✅ |
| Work logs, decision log, review log, test reports, Code Concepts Index | `docs/worklogs/`, `docs/decisions/`, `docs/reviews/`, `docs/testing/`, `docs/learning/` | ✅ structures ready |

## Language
The course instructions don't mandate a language. Team instruction (21 Nov 2026, D-08): **write the PRD and documentation in English.**
