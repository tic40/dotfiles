---
name: aicm
description: Generate a one-line English commit message from currently staged changes and commit. Replaces the `git aicm` shell alias (which used metered `claude -p`) by running inside Claude Code instead. Use when the user invokes /aicm, or asks to "stage からコミット", "コミットメッセージを生成してコミット", "generate a commit message and commit", or similar after staging changes with `git add`.
---

# aicm

Generate a one-line commit message from the staged diff and commit, without using metered API calls.

## Workflow

1. Get the staged diff:
   ```bash
   git diff --cached
   ```
2. If the diff is empty, tell the user nothing is staged (`git add` first) and stop. Do NOT stage files automatically.
3. Generate **exactly one line** as the commit message:
   - English, imperative mood (e.g. "Add", "Fix", "Refactor", not "Added"/"Adds")
   - Summarize **what** changed and **why** in a single summary line
   - No body, no explanation, no trailing period, no markdown, no quotes
   - Keep it concise (~72 chars target)
4. Show the generated message to the user, then commit:
   ```bash
   git commit -m "<message>"
   ```
   - Invoking this skill is the user's approval to commit; commit directly without an extra confirmation prompt.
   - Do NOT pass `-e` (it opens an interactive editor that does not work in this harness).
   - Do NOT add a `Co-authored-by` trailer. The author is the repo's configured git user.

## Notes

- The commit author/committer is whatever `git config user.name` / `user.email` resolves to — the user, not Claude.
- This skill only commits already-staged changes. It never runs `git add`, `git push`, or any other write operation.
