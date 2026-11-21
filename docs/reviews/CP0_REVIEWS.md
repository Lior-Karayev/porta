# CP0 PRD — Independent Reviews and Resolution

Draft reviewed: PRD v0.9 (commit d7e7f7f). All findings resolved in v1.0 unless marked otherwise. No critical findings remain open.

## Codex — Technical feasibility (12 findings)
| ID | Sev. | Finding (short) | Resolution in v1.0 |
|---|---|---|---|
| CX-01 | major | First end-to-end test too late (M3); M4 overloaded | M1 now delivers a deployed vertical slice; M2–M4 re-scoped; fixed Should add-order in §7.2 |
| CX-02 | major | Firebase Functions need Blaze billing; no free alternative listed | Supabase Free + transactional DB function added (§11.3, R-05, Q-09, D-18) |
| CX-03 | major | Guest page tech / domain / deep-link files | Proposed lightweight HTML/JS on default domain (Q-14, Q-15, R-08, D-17) |
| CX-04 | **critical** | Counter committed separately from gate state/event; checks exposed to concurrent edits | Single atomic transaction for receipt + checks + counter + `simOpenUntil` + event; push after commit (FR-20, FR-24, Diagram 3 redrawn, D-15) |
| CX-05 | major | Replay behaviour of request ID undefined | Receipt keyed by (invitation, requestId) replays original result (E-08, AC-07.2); creation idempotency added (FR-16, E-04 `createRequestId`) |
| CX-06 | major | Hash-only storage can't re-share link | Digest for lookup + owner-only readable link (FR-15, E-07, NFR-05, D-16) |
| CX-07 | major | Lifecycle inconsistencies (scheduled suspension, resume, precedence) | FR-10/FR-13 clarified; removed-resident permissions can't resume; AC-01.1 "displayed as" |
| CX-08 | major | Time semantics / DST | One-time = instants; recurring = inclusive local dates, start-incl/end-excl windows; DST gap rejected, repeat = first occurrence (FR-06, FR-07, E-04) |
| CX-09 | major | ERD optionality gaps; no admin audit entity | Optional `communityId`, optional event FKs, `guestNameSnapshot`, new E-12 AdminAction; ERD updated |
| CX-10 | major | Performance metrics conflate page vs simulator; test conditions unspecified | G5 / NFR-01 split (a)/(b); device, "Fast 4G" profile, cache state; NFR-02 compressed bytes, all 10 loads |
| CX-11 | major | Push mixed into Must AC; session inactivity undefined; G3 median | AC-06.2a (Should, 19/20 trials); NFR-08 defines reset; NFR-16 "median" |
| CX-12 | minor | US-17 typo; F-15/FR-14 priority mix; AC-07.4 vs AC-11.3 | Fixed reference; FR-14 sourced from F-01/F-02; Should ACs tagged; inactive allowed gates shown disabled |

## Antigravity — UX (9 findings)
| ID | Sev. | Finding (short) | Resolution in v1.0 |
|---|---|---|---|
| AG-01 | major | Dead ends: rejected/removed users; S-11 | S-01 rejected/removed state; S-11 → S-02 (table, Diagram 4) |
| AG-02 | major | Missing "Opening…" state; double-tap can burn an opening | AC-07.3 + W-01: in-flight disabled state, 5 s countdown |
| AG-03 | major | AC-07.4 vs AC-11.3 conflict; no refresh on early arrival | Aligned; "Check again" + auto-refresh (AC-08.1, W-01) |
| AG-04 | major | Cancel too close to safe actions; regenerate doesn't lead to share | Cancel separated as destructive w/ confirmation; regenerate → S-05 (AC-05.3) |
| AG-05 | major | S-13 no entry point; Diagram 4 missing edges | "+ New permission" chooser; S-04→S-03/S-05/S-06 edges; FR refs aligned |
| AG-06 | major | Wizard step 3 merged type/when, no date range | S-07 wireframe shows step 3 "When" incl. inclusive date range |
| AG-07 | minor | Exhausted card under Active tab; reset password; empty state | Fixed S-02 wireframe; status buckets defined in FR-14; S-01 reset/sign-out; empty state |
| AG-08 | minor | Optional guest phone = unused PII; defaults | Guest phone removed from MVP (D-20); defaults stated |
| AG-09 | major | RTL bidi + accessibility rules missing | RTL & a11y rule box added to §10 |

## Claude — Security & access control (6 findings)
| ID | Sev. | Finding (short) | Resolution in v1.0 |
|---|---|---|---|
| SEC-01 | major | No defined way to create communities/first admin (privilege bootstrap) | Team-provisioned; no self-elevation (§4 note, §7.4, A-11, D-21) |
| SEC-02 | major | Token in URL path leaks to hosting logs/referrers | Fragment-carried token where feasible + `no-referrer` (NFR-05, Q-14) |
| SEC-03 | major | Link-preview crawlers/prefetch could trigger actions or leak details | NFR-19: only explicit POST opens; generic previews |
| SEC-04 | minor | Join-code brute force | Rate limit 5 failures/account/hour (NFR-06) |
| SEC-05 | minor | No password policy | ≥ 8 chars; reset by email Should (FR-01) |
| SEC-06 | minor | No audit trail of admin actions | NFR-20 + E-12 AdminAction |

## Codex verification round (v1.0 → v1.0.1)
Codex re-checked CX-01…CX-12: 8 resolved; 4 needed more work, plus 2 new major issues. All fixed:
| Item | Fix |
|---|---|
| CX-03 | Q-14/Q-15 (guest-page tech + link domain) now due at **start of M1**, before the slice is deployed |
| CX-04 | Check table adds "owning resident still an approved member" (check 4); Supabase fallback must lock permission + invitation + gate rows (or serializable isolation) |
| CX-05 | E-08 stores `remainingAfter`; request ID reused for another gate → `DUPLICATE_REQUEST`, nothing counted; unknown commit outcome → "couldn't confirm" + safe same-ID retry |
| CX-07 | Diagram 2: resume leads to ACTIVE / SCHEDULED / EXPIRED / EXHAUSTED (re-derived) |
| NEW-1 (major) | Diagram 3 reordered: receipt replay happens **before** the per-invitation quota; only the per-IP invalid-link limit precedes the transaction |
| NEW-2 (major) | FR-26: rate-limited attempts are logged as one summary event per invitation (or IP) per minute with `attemptCount` |

## Not adopted / deferred
- CX-01 suggested deferring *all* other Shoulds incl. editing/regeneration. Adopted as an explicit add-order (§7.2) rather than removal, so the MVP definition (all Musts) is unchanged and Shoulds are cut from the tail if time runs out.
- CX-08 suggested requiring user disambiguation for repeated DST wall times; v1.0 uses "first occurrence" for simplicity (one hour per year in late October). Revisit in M2 if tests show confusion.
