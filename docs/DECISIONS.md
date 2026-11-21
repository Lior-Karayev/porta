# Porta — Decision Log

Status values: **Confirmed** (by the team) · **Proposed** (awaiting team approval) · **Open** (see PRD §15).

| ID | Decision | Status | Source / date |
|---|---|---|---|
| D-01 | Project name: Porta. Flutter/Dart, Android + iOS. | Confirmed | Team, 21 Nov 2026 |
| D-02 | All gates are simulated; no real hardware integration in the course. | Confirmed | Team |
| D-03 | Permissions are one-time or recurring; each has a total opening limit that is cumulative over the permission's lifetime and never resets. | Confirmed | Team |
| D-04 | Guests use invitation links in a web browser without registration; registered users may open them in the app. | Confirmed | Team |
| D-05 | Support Android App Links / iOS Universal Links where feasible (PRD: Should, web fallback always works). | Confirmed (feasibility pending, R-04/R-09) | Team |
| D-06 | Full product vision includes AI natural-language creation (F-19) and a guided assistant (F-21). | Confirmed | Team |
| D-07 | The 21 features are candidate requirements; none silently excluded. | Confirmed | Team |
| D-08 | PRD and documentation written in English. | Confirmed | Team, 21 Nov 2026 |
| D-09 | MVP target date 31 Jan 2027. | Confirmed | Team |
| D-10 | MoSCoW: Must F-01–F-04, F-07–F-09, F-13 · Should F-06, F-10, F-14, F-15, F-21 · Could F-05, F-11, F-19 · Won't (this release) F-12, F-16–F-18, F-20. | Proposed | PRD §7.1 |
| D-11 | MVP does not depend on AI. F-21 ships as a rule-based wizard; F-19 is a Could stretch requiring cost approval; F-20 → M7. | Proposed | PRD §7.5, Q-04 |
| D-12 | Backend candidate: Firebase (Auth, Firestore, Cloud Functions, Hosting, FCM). Cloud Functions require Blaze billing plan → budget approval needed. | Proposed / Open | PRD A-03, Q-09 |
| D-13 | Gate-open validation is server-side, fail-closed, atomic counter + request-ID idempotency; tokens ≥128-bit, stored hashed. | Proposed | PRD Diagram 3, NFR-04–07, NFR-11 |
| D-14 | Team member responsibilities | Open (TBD) | Q-01 |
