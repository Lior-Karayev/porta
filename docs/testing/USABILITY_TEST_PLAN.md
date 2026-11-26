# Porta — Usability Test Plan (Q-02)

**Status:** proposed plan. **No test has been run, and there are no participants or results yet.** The team confirms participant recruitment and the final procedure during Sprint 3. The test itself runs in Sprint 4 (10–23 Jan 2027), on the release-candidate build.

**Coordinator (provisional):** Lior Karayev (Contributor C). **Observers and note-takers:** Daniel Benfusi and Avishag Yonatan, as available.

**Goals measured** (Master PRD §6): G3 (create and share a recurring permission in a median of ≤ 90 s), G4 (guest opens the gate in ≤ 2 taps; ≥ 90% of first-time guests succeed without help), G7 (SUS ≥ 70). The test also collects the first resident feedback for R-11 (no user research yet).

## 1. Participants

- **At least 5 participants**, in two roles:
  - **Residents:** people who live in a gated community or regularly host visitors. Aim for 3 or more.
  - **Guests:** anyone with a smartphone who has not seen Porta before. Aim for 3 or more. One person may do both roles, guest first.
- Not team members, and not people who helped design the screens.
- Recruited by the team through personal contacts. No payment.
- **Consent:** each participant agrees verbally to take part and to be timed. No names, phone numbers or recordings of faces are stored. Results are recorded under codes (P1, P2, …).

## 2. Setup

- **Device:** one Android phone with the release-candidate app, plus Chrome on Android for the guest page. iOS is not available (PRD §12), so no iOS sessions are run.
- **Environment:** the demo environment with seed data (one community, gates "Main" and "North", one approved demo resident account). Restore the seed data before each session (NFR-13).
- **Roles in each session:** a facilitator (reads the scenario, does not help unless the participant is stuck for 60 s), a note-taker (times and observations), and a simulator screen (S-10) visible to the note-taker.
- **Session length:** about 20 minutes.

## 3. Scenarios and success criteria

The facilitator reads each scenario aloud and does not name buttons or screens.

| # | Role | Scenario (read to the participant) | Success criterion (observable) | Measures |
|---|---|---|---|---|
| U1 | Resident | "Your cleaner, Rina, comes every Tuesday from 8 to 12 until the end of March. Give her access to the Main gate and send her the invitation." | A recurring permission with Tuesday, 08:00–12:00, the end of March and gate Main is saved, and the share sheet is opened. | Time from the home screen (S-02) to the share sheet; errors; help requests → **G3** |
| U2 | Guest | (The participant receives the link on the test phone.) "You've arrived at the gate. Get in." | The gate on the simulator shows OPEN. | Taps from page load to grant; success without help → **G4** |
| U3 | Guest | "Try the same invitation again, outside the allowed hours." (Facilitator sets the time window so it is closed.) | The participant can say why they can't get in and when they can. | Correct explanation in their own words (FR-21 guidance) |
| U4 | Resident | "Rina no longer works for you. Make sure she can't get in." | The permission is cancelled after the confirmation dialog. | Success; time; whether they confused Suspend with Cancel |
| U5 | Resident | "Create access for a gardener by describing it in words: every Sunday from 7 to 10 until the end of March." (Only if P-F06 is available in the build.) | The draft opens in the form. The participant fills in the "please choose" fields and saves, or deliberately abandons the draft. | Success; whether they noticed the AI-filled and "please choose" fields; time |
| U6 | Resident | "Find out whether Rina came in today." | The activity screen (S-06) shows the entry. | Success; time |

## 4. Questions

**After each scenario:** "How easy or hard was that, from 1 (very hard) to 5 (very easy)?" and "What, if anything, surprised you?"

**After all scenarios:**

1. The 10 standard **System Usability Scale (SUS)** statements (Brooke, 1996), each rated 1–5 → **G7**.
2. "Would you trust this to let a service provider into your community? Why or why not?"
3. "How do you handle visitors at your gate today?" (residents only; input for R-11 and PRD §3)
4. "Was anything missing that you expected?"
5. Guests only: "Would you have preferred to install an app? Why?"

## 5. Pass thresholds (from the PRD)

| Goal | Threshold | Computed from |
|---|---|---|
| G3 | Median U1 time ≤ 90 s | U1 times of all resident participants |
| G4 | (a) ≤ 2 taps; (b) ≥ 90% succeed without help | U2 |
| G7 | Mean SUS score ≥ 70 | SUS questionnaire |

With 5–6 participants, these are indicators, not statistically strong results. The report says so.

## 6. Report template

Copy into `docs/testing/TEST_REPORTS.md` as a new report (e.g. T4-U).

```markdown
### T4-U · Usability test · <date range>

| Field | Value |
|---|---|
| Build | <app version / commit>, guest page <commit> |
| Device | <Android model, Android version, Chrome version> |
| Participants | <n> (residents: <n>, guests: <n>), codes P1–P<n> |
| Facilitator / note-taker | <names> |
| Deviations from the plan | <none, or what changed and why> |

| Participant | Role | U1 time (s) | U1 ok | U2 taps | U2 without help | U3 ok | U4 ok | U5 ok | U6 ok | SUS |
|---|---|---|---|---|---|---|---|---|---|---|
| P1 | … | … | … | … | … | … | … | … | … | … |

**Results against goals:** G3 median = … s (target ≤ 90) · G4 taps = … / success = …% (target ≤ 2 / ≥ 90%) · G7 SUS mean = … (target ≥ 70)

**Main observations** (problem, how many participants, severity, screen):
1. …

**Actions:** <Issue links, owner, sprint>. Anything not fixed before 30 Jan goes to the release notes or the carryover log.
```

## 7. Rules

- Record only what actually happened. Never invent participants, times, scores or quotes.
- If fewer than 5 participants take part, report the real number and mark G3, G4 and G7 as "not measured as planned".
- Changes to this plan are made through a PR and noted in the report's "Deviations" field.
