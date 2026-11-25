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
- **Auto mode and permission prompts do not change the policy.** An approved tool call is not an authorisation to merge, push to `main`, spend money or leave the checkpoint.
- **Background sessions and PR watchers** (for example `/ship` or `/steward`) must stop at `READY_FOR_HUMAN_REVIEW`. They must never run `gh pr merge` or enable auto-merge on this repository.
- **Memory:** Claude Code's personal memory files are not project policy. When a remembered preference conflicts with `AGENTS.md`, `AGENTS.md` wins.
- **Commits:** Commit only to the task branch. Pass the base branch explicitly when you open a PR (`gh pr create --base main`), because the repository's default branch may not be `main` (see `docs/team/GITHUB_PROTECTION.md`).
