# CP0 — Assignment Requirements Checklist

Source: instructor assignment "מטלה: מסמך דרישות מוצר (PRD)" (K. Zoabi, Kinneret College, 2026–27). Every mandatory item and where the PRD (`docs/prd/Porta-PRD.pdf`) covers it.

## Deliverable
| # | Requirement | Where | Status |
|---|---|---|---|
| D1 | One complete PRD per team, single PDF, submitted in Moodle | `docs/prd/Porta-PRD.pdf` | ✅ PDF ready — upload to Moodle is done by the team |
| D2 | Team member details, app characterization, relevant diagrams and sketches | §1, §2–13, Diagrams 1–8 | ✅ |
| D3 | Full product characterization **and** a clear first version (MVP) | §7.1 (full), §7.2 (MVP) | ✅ |

## The 15 sections, in order
| # | Section | Required contents | Where | Status |
|---|---|---|---|---|
| 1 | Project details & team | App name, members, initial responsibility; tip: version + date | §1, cover, revision history | ⚠️ Surnames + responsibilities TBD (Q-01) |
| 2 | Summary & vision | What it does (short), goal & value, full-product vision | §2 | ✅ |
| 3 | Problem & need | Who suffers & from what; current coping & what fails; why needed & evidence; problem described without the app | §3 | ✅ (no research yet — stated explicitly, Q-02) |
| 4 | Audience & user types | Characteristics, needs, roles, allowed / not allowed per type | §4 table + Diagram 1 | ✅ |
| 5 | Existing solutions & differentiation | Similar apps/services, what's missing, our advantage; tip: comparison table | §5 two tables | ✅ (products not verified hands-on, Q-03) |
| 6 | Goals & success metrics | Goal, metric, numeric target, timeframe | §6 (G1–G7) | ✅ |
| 7 | Scope & prioritization | All capabilities; MVP; later; explicitly out of scope; MoSCoW tip | §7.1–7.5 | ✅ all 21 features covered |
| 8 | Functional requirements | ID, clear description, user type, priority; testable, no tech names | §8 FR-01–FR-40 | ✅ |
| 9 | User stories & scenarios | As a/I want/so that; Given/When/Then; happy path, errors, edge cases; link to FR | §9 US-01–US-13 (H/E/X tags) + Diagram 3 | ✅ |
| 10 | Screens & UX | Screen, purpose, actions, navigation; **wireframes mandatory** | §10 table, Diagram 4, Wireframes 5a–6b | ✅ |
| 11 | Data & external interfaces | Stored data, entities & relations (ERD), external services/APIs; AI: input/output/failure | §11.1–11.4, Diagram 7 | ✅ |
| 12 | Platforms & device capabilities | Android/iOS, screen sizes, camera/location/notifications/local storage — why + permission denied | §12 | ✅ |
| 13 | Non-functional requirements | Performance, security, privacy, accessibility, reliability, usability, weak/no connection | §13 NFR-01–NFR-18 | ✅ |
| 14 | Assumptions, constraints, dependencies, risks | Constraints, assumptions, dependencies, risk + mitigation | §14 | ✅ |
| 15 | Milestones & open questions | Stage, what is done, expected output; open questions list | §15 + Diagram 8 | ✅ |

## Diagrams (each needs title, short explanation, consistency with text)
| Diagram | Where | Title | Explanation | IDs consistent |
|---|---|---|---|---|
| Use Case (for §4, §8) | Diagram 1 | ✅ | ✅ | ✅ |
| Process diagram (for §9) | Diagram 3 (+ lifecycle Diagram 2) | ✅ | ✅ | ✅ |
| User Flow (for §9, §10) | Diagram 4 | ✅ | ✅ | ✅ |
| Wireframes (**mandatory**, §10) | Diagrams 5a, 5b, 6a, 6b | ✅ | ✅ | ✅ |
| ERD (for §11) | Diagram 7 | ✅ | ✅ | ✅ |

## Pre-submission checklist (from the assignment, page 6)
- [x] App name, team member names and responsibility split at the start — names present; **surnames + responsibilities TBD (Q-01)**
- [x] All 15 sections present, in order
- [x] Happy path, error states and edge cases covered (§9 H/E/X)
- [x] Wireframes of the main screens attached
- [x] Every diagram has a title + short explanation and matches the text
- [x] Non-relevant parts marked with a short explanation (camera/location in §12 marked "No (MVP)" with reasons)
- [x] MVP clearly defined, plus what is not included (§7.2, §7.4)
- [x] Every FR has ID, description, user type and priority
- [x] User stories have testable acceptance criteria
- [x] NFRs address weak/no connection (NFR-14)
- [x] Identical names and IDs across the document (Appendix A traceability)
- [x] Sources cited (Appendix B)
- [x] Saved as one PDF, ready for Moodle

## Language
Course instructions don't mandate a language. Team instruction (21 Nov 2026): **write the PRD and documentation in English.**
