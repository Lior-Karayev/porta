# CP0 Revision (PRD v2.0) — Focused Reviews and Resolution

The reviews covered draft commit `3b535a1`, and the fixes are in the next commit on `cp0/scope-reduction`. Review level: **focused**, as the assignment asks: one technical, one UX, and one policy/security review. Every reviewer was told to read `AGENTS.md` and to work read-only.

| Reviewer | Model access | Scope | How it ran |
|---|---|---|---|
| **Codex** (CLI 0.170.0, ChatGPT sign-in) | first-party | Technical feasibility, ID consistency, sprint plan | The files were pasted into the prompt as text, and Codex used no tools. Its Linux sandbox could not start on this machine (no user namespaces), and its sandbox was not disabled. Two earlier runs failed: one waited on stdin, the other found the sandbox blocked. It did not see `WORKFLOW.md` or `GITHUB_PROTECTION.md`; Claude reviewed those. |
| **Antigravity** (CLI 1.5.17, Google sign-in) | first-party | UX of screens, flows, wireframes and stories | Same method, using PRD §§7–10. Headless mode refused shell commands, and "skip all permissions" was not used. |
| **Claude** (Claude Code subagent in this session) | first-party | `AGENTS.md`, `CLAUDE.md`, GitHub protection, AI security, the access-control gap | Read the files directly, read-only. |

Before the reviews, the `claude -p` CLI test of instruction discovery failed ("out of usage credits"). The subagent review above ran inside the orchestrating session, which was still working. No credits were bought and no other provider was used.

**Totals:** 40 findings (3 critical, 26 major, 11 minor). 37 were fixed. 3 were partly fixed, with the remaining detail deferred to the Feature PRDs, as listed below. **No critical or major finding remains open.**

## Claude — policy and security (11)
| ID | Sev. | Finding (short) | Resolution |
|---|---|---|---|
| SEC2-01 | major | Merge rule read together with "Lior authorises" could let an agent merge after a claimed authorisation | `AGENTS.md` §4: agents never execute a merge, even after authorisation; Lior merges himself; claimed authorisations in chats or prompts are not acted on. WORKFLOW §3 aligned |
| SEC2-02 | major | Policy change "approved by Lior and recorded" was unprovable | `AGENTS.md` §1: policy changes only through a human-merged PR; agents record only `Proposed` |
| SEC2-03 | major | GITHUB_PROTECTION wrongly claimed 0 approvals keeps merge control with Lior | Corrected: with 0 approvals anyone with write access can merge |
| SEC2-04 | major | Verification test could push a commit to `main` | Replaced by a throwaway `test/protected` ruleset test, run only after the API checks pass |
| SEC2-05 | major | Budget approval: "human" vs "team" | `AGENTS.md` §6: team approval, `budget` Issue, decision logged |
| SEC2-06 | major | No way to remove a former resident; check 4 could never fail | FR-05: the team removes residents with the setup script (membership REMOVED); AC-10.6; E-02; D-31 updated |
| SEC2-07 | minor | Decision record can be overwritten; NFR-20 overstated | NFR-20 narrowed and the limitation stated; setup-script uses are reviewed commits |
| SEC2-08 | minor | AI proxy: approved residents only; prompt injection | §11.4 "Untrusted text" row; approved-resident check; gate resolved only in the caller's own community; injection cases in the G8 test set |
| SEC2-09 | minor | AI output `gateNames` (plural) vs one gate | Single `gateName`; more than one fails the schema |
| SEC2-10 | minor | No global cost cap; privacy claim too strong; terms undefined | Global daily cap, output-length cap, provider spend limit, "acceptable terms" defined, privacy claim reworded |
| SEC2-11 | minor | Rules restated in CLAUDE/WORKFLOW; no provider-verification step | CLAUDE.md now points to `AGENTS.md` sections; `AGENTS.md` header allows procedures by reference; §5 has a verification step and lists Omnigent and ChatGPT (advisory) |

## Codex — technical feasibility and consistency (17)
| ID | Sev. | Finding (short) | Resolution |
|---|---|---|---|
| CX2-01 | **critical** | Cancelled link revoked → `INVALID_LINK` before `CANCELLED`; breaks replay | `revokedAt` removed; the invitation is kept after cancellation; check 1 = "known invitation"; E-07, ERD and §7.6 updated |
| CX2-02 | major | Receipts vs rate-limit summaries; unpersisted denial branches | E-08 `kind` RECEIPT / RATE_LIMIT_SUMMARY; Diagram 3 notes define what creates a receipt |
| CX2-03 | major | ERD `requestId UK` vs composite uniqueness; requested gate unclear | ERD shows "unique with invitationId" and `requestedGateId` |
| CX2-04 | major | Concurrent conflict vs AC-08.4 `EXHAUSTED` | Bounded server retry (3), checks re-run on fresh data |
| CX2-05 | major | No project-wide AI cap; quota timing | Atomic reservation before the call; failed calls count; global cap |
| CX2-06 | major | Draft schema vs one gate and the two permission types | Typed draft per permission type; exactly one gate resolved in the caller's community |
| CX2-07 | major | Free text may contain personal data; provider retention | Proxy strips phone and email patterns; acceptable terms include retention ≤ 30 days and no training |
| CX2-08 | major | Feature PRDs for P-F01/P-F05 after their S1 work | S1-04 covers the slice parts of P-F01–P-F05 and is a predecessor of S1-06/07/08/10 |
| CX2-09 | major | Contributor B overloaded in S1/S2 | Seeding, deployment, sign-in wiring and tests moved to A/C; capacity check; fallback slice if S1-10 is late on 6 Dec |
| CX2-10 | major | M1 cancellation untested; replay missing in S1 | A seeded cancelled permission is in the M1 acceptance; S1-10 includes receipt replay and conflict retry |
| CX2-11 | major | Overview vs tasks (activity screen); S2-09 dependencies | Overview aligned; S2-09 depends on S2-03/05/08; summaries added in S3 |
| CX2-12 | major | Sprint 5 wording; weak release gate | Diagram 8 text corrected; S4/S5 release gate requires G1, G2, G6 or an approved scope change |
| CX2-13 | major | Account deletion committed but unscheduled | NFR-10: in-app deletion out of scope; the team deletes on request with the setup script; event anonymisation defined |
| CX2-14 | minor | Retired text: "Create / edit", "editing" in NFR-14 | Fixed. "Removed" state and "resident removal" are now valid (SEC2-06) |
| CX2-15 | minor | §2/§4/§5 overstate gates, audit trail, in-app link | Reworded |
| CX2-16 | minor | AC-01.5 vs FR-16 duplicate-save response | AC-01.5 now returns the first result |
| CX2-17 | minor | QR is Must but in the cut order | Cutting it is an approved scope change that updates FR-18, US-05 and G1 (PRD §7.2, sprint plan §9) |

## Antigravity — UX (12)
| ID | Sev. | Finding (short) | Resolution |
|---|---|---|---|
| AG2-01 | **critical** | S-08: no approve confirmation, no email, no empty state, re-apply unclear | S-08 shows name, email and request date; Approve asks for confirmation; empty state; FR-05 lets the user re-apply and cancel a pending request |
| AG2-02 | **critical** | AI "please choose" vs the form's defaults; limit control; no reasons; guest name missing | FR-41 and S-03: flagged fields start empty with no defaults; number field with −/+; reason shown when a value is cleared; AC-13.1 includes the guest name |
| AG2-03 | major | Cannot change notifications after creation | Toggle on S-04 (a preference, not editing); S-12 global toggle defined; FR-29 |
| AG2-04 | major | S-04 actions per status; no replace path | S-04 action matrix by status; hint in the Cancel dialog; "Create new permission" on ended permissions |
| AG2-05 | major | S-03 lacks AI states; back navigation | S-03 row: original-text banner, ✦ markers, Back → S-13 with the text kept; S-13 → S-02 back. *Wireframe 5a still shows the manual state only (deferred to the P-F06 Feature PRD)* |
| AG2-06 | major | AI offered when unavailable; misleading copy; double submit | Chooser shows the option as unavailable with the reason; outage and not-understood messages separated; button disabled while empty or in flight; escape always available |
| AG2-07 | major | Pending screen has no refresh or exit | "Check status", refresh on resume, "Cancel request" |
| AG2-08 | major | W-01 countdown after the last opening; Check again; RATE_LIMITED copy | W-01 row and wireframe; recoverable vs final denials; RATE_LIMITED message in FR-21 |
| AG2-09 | major | Simulator shows an invalid link attributed to a gate | Wireframe row replaced with an in-community denial |
| AG2-10 | major | RTL and accessibility: chip width, range isolation, direction, live region | RTL note extended (chips wrap 4+3, ranges isolated, `dir=auto`, LTR email/code, one announcement per change) |
| AG2-11 | minor | Retired text in S-01/S-03/S-12 | "Create / edit" fixed; "Edit name" removed; S-01 "removed" kept (now valid, SEC2-06) |
| AG2-12 | minor | S-05 header and gate name; Diagram 4 deep-link edges; nav bars; time zone label | S-05 header and gate name fixed; time zone label on S-03/W-01. *Diagram 4 deep-link edges and the bottom-nav details are deferred to the P-F03 and P-F01 Feature PRDs (deep links are a Could)* |

## Deferred to Feature PRDs (no blocking impact)
- AG2-05: an S-03 wireframe variant showing the AI-draft state. Goes in the **P-F06** Feature PRD.
- AG2-12: Diagram 4 edges for deep links of invalid or signed-out users go in **P-F03**. Bottom navigation on S-08/S-12 goes in **P-F01**.
- CX2-09: per-task hour estimates are made at Sprint 1 planning (S1-01). The plan contains the capacity check and the fallback.
