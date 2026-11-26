# CLAUDE.md — Porta

The shared rules for every AI agent on this project are in `AGENTS.md`. They are **mandatory** for Claude Code, and they are imported here so that Claude Code loads them at session start:

@AGENTS.md

If the import above did not load (for example, an older Claude Code version or a tool that reads this file as plain text), **read `AGENTS.md` before doing any project work.**

## Before you start work

1. Follow the session-start procedure in `AGENTS.md`, Section 2: establish which contributor is directing you, then read `docs/team/CONTRIBUTORS.md`.
2. Check the current checkpoint in `README.md` and the current sprint in `docs/sprints/SPRINT_PLAN.md`.
3. Follow the collaboration workflow in `docs/team/WORKFLOW.md`.

## Claude Code specifics

- **Subagents** (the Agent tool) do not reliably inherit this file's imports. When you delegate, tell the subagent to read `AGENTS.md` first, or include the rules that apply to its task (`docs/team/WORKFLOW.md`, Section 4).
- **Auto mode and permission prompts do not change the policy.** Approving a tool call in Claude Code is not one of the authorisations in `AGENTS.md` Sections 1, 4 and 6.
- **Background sessions and PR watchers** (for example `/ship` or `/steward`) end at `READY_FOR_HUMAN_REVIEW`, as `AGENTS.md` Section 4 requires. Do not use their merge or auto-merge steps on this repository.
- **Memory:** Claude Code's personal memory files are not project policy. When a remembered preference conflicts with `AGENTS.md`, `AGENTS.md` wins.
- **Opening PRs:** `gh pr create` uses the repository's default branch unless `--base` is given, and that branch may not be `main` (`docs/team/GITHUB_PROTECTION.md`).
