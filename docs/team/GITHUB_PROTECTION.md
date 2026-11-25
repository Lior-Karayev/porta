# GitHub Protection for `main`

This guide is for the repository owner (Lior). Agents **must not** change repository settings and must never claim that a protection is active until it has been verified (`AGENTS.md`, Section 4).

## 1. Verified current state (25 Nov 2026)

These values were read with the agent's GitHub credentials (read-only calls). Nothing was changed.

| Setting | Value found | Meaning |
|---|---|---|
| Repository visibility | **Public** | Rulesets and branch protection are available on the free plan. The PRD previously said "private"; it has been corrected. |
| Default branch | **`cp0/prd`** | ⚠️ New PRs target `cp0/prd` unless the base is set. Should be **`main`**. |
| Rulesets (`GET /repos/…/rulesets`) | **None** | No ruleset protects `main`. |
| Rules applying to `main` (`GET /repos/…/rules/branches/main`) | **None** | Nothing currently blocks direct pushes or force pushes by rulesets. |
| Classic branch protection on `main` | **Unknown** | The agent token is not allowed to read it (HTTP 403, "Resource not accessible by personal access token"). The owner must check it in the web UI. |
| Allow auto-merge | **Off** | Good. Keep it off. |
| Collaborators | `Lior-Karayev` (admin), `XVortXx` (write), `avishagyonatan-design` (write) | Account-to-person mapping is not confirmed in `CONTRIBUTORS.md`. |
| Agent credentials | Omnigent's agents on Lior's machine use a fine-grained token of the **`Lior-Karayev`** account | GitHub cannot tell these agents apart from Lior (see Section 3). |

**Conclusion:** `main` is **not verifiably protected** today. The no-merge rule is currently enforced by policy (`AGENTS.md`) only.

## 2. Recommended configuration

### Step 1: Make `main` the default branch

Settings → General → Default branch → switch to `main` → Update.

Do this before more PRs are opened, so that `gh pr create` and the web UI target `main` by default.

### Step 2: Create a branch ruleset for `main`

Settings → Rules → Rulesets → **New ruleset** → New branch ruleset:

| Field | Value |
|---|---|
| Ruleset name | `protect-main` |
| Enforcement status | **Active** |
| Bypass list | **Empty**. Do not add yourself, roles or apps. |
| Target branches | Add target → Include default branch (after Step 1), or Include by pattern `main` |
| Restrict deletions | ✅ |
| Block force pushes | ✅ |
| Require a pull request before merging | ✅, with Required approvals = **0** (see Section 3), Dismiss stale approvals ✅, Require conversation resolution ✅ |
| Require status checks to pass | ✅ **once CI exists** (Sprint 1). Add the CI job names, e.g. `analyze`, `test`. Leave it off until then, or merges will be blocked by checks that never run. |
| Require linear history | Optional. Recommended if the team settles on squash merges. |

Equivalent command for the owner (run it yourself; agents must not):

```bash
gh api -X POST repos/Lior-Karayev/porta/rulesets --input - <<'JSON'
{
  "name": "protect-main",
  "target": "branch",
  "enforcement": "active",
  "bypass_actors": [],
  "conditions": { "ref_name": { "include": ["refs/heads/main"], "exclude": [] } },
  "rules": [
    { "type": "deletion" },
    { "type": "non_fast_forward" },
    { "type": "pull_request", "parameters": {
        "required_approving_review_count": 0,
        "dismiss_stale_reviews_on_push": true,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_review_thread_resolution": true } }
  ]
}
JSON
```

The current agent token cannot run this (it has no administration permission), which is intended.

### Step 3: Keep auto-merge off

Settings → General → Pull Requests → **Allow auto-merge** stays unchecked.

### Step 4: Give agents a limited token

When creating or renewing the fine-grained token that agents use:

- Repository access: only `Lior-Karayev/porta`.
- Permissions: Contents **Read and write**, Pull requests **Read and write**, Issues **Read and write**, Metadata **Read**. Add Actions/Checks **Read** if agents need to read CI results.
- **No** Administration permission, so that agents can never change rulesets or settings.
- Contributors A and B configure their own tools with their own accounts in the same way.

### Step 5: Add required checks after CI exists

After the first CI workflow merges (Sprint 1), edit `protect-main` → Require status checks → add the job names.

### Step 6: Verify, then record it

Run these and record the result and date in Section 1 of this file (through a PR):

```bash
gh api repos/Lior-Karayev/porta --jq .default_branch          # expect: main
gh api repos/Lior-Karayev/porta/rulesets                       # expect: protect-main, active
gh api repos/Lior-Karayev/porta/rules/branches/main            # expect: deletion, non_fast_forward, pull_request
```

A practical test, **only after the three API checks above show the ruleset as active**: push a branch `test/protected`, create a throwaway ruleset with the same rules on that pattern, then try to force-push to it (`git push --force origin HEAD~1:test/protected`). It must be **rejected**. Delete the throwaway branch and ruleset afterwards. Never test by pushing a new commit to `main` itself: if the protection were missing, the test would change `main`.

## 3. What GitHub can and cannot enforce here

- **Direct pushes and force pushes to `main`** are blocked for everyone, including the owner and every AI token, once the ruleset is active with an empty bypass list.
- **Who may merge a PR** cannot be limited to Lior's *person*. Anyone with write access, including an agent using that person's token, can technically press *Merge* on a PR that satisfies the rules. A ruleset's **Restrict updates** rule, with the *Repository admin* role as the only bypass actor in "pull requests only" mode, would limit merges to the admin **account** (`Lior-Karayev`). Before relying on it, the owner should check that the option is offered for this personal repository. Even then, Lior's own agents act as that account, so the rule cannot separate them from Lior.
- **Required approvals.** With the value 0, **anyone with write access** (`XVortXx`, `avishagyonatan-design`, and every agent using one of those accounts or Lior's) can technically merge any PR that passes the other rules, including Lior's. Only the policy, or the *Restrict updates* option above, limits that. Setting the value to 1 adds a second pair of eyes, but a teammate's approval would then be enough to unlock a merge, and Lior would need a teammate's approval for his own PRs, because agents acting as `Lior-Karayev` cannot approve his PRs. 0 is recommended to start with, because the ruleset's main job here is to block direct pushes, force pushes and deletion. The team may raise it to 1; record that as a decision.
- **Therefore**, "only Lior authorises merges" remains a **policy** rule (`AGENTS.md`, Section 4) that every agent must obey. GitHub protects against direct pushes, history rewrites and deletion, but not against an agent that ignores the policy and merges a valid PR.
- **Stronger option (later, optional):** move the repository into a free GitHub organisation and give agents a separate machine account. Rulesets can then tell agents and humans apart. This is a team decision.
