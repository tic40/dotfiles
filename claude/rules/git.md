# Git Workflow

## Commit

```bash
# Check status
git status
git diff

# Stage (prefer individual files)
git add <file>

# Commit
git commit -m "type: summary"
```

## Commit Message Types

```
feat: new feature
fix: bug fix
refactor: refactoring
test: add/update tests
docs: documentation
chore: maintenance
```

## Branch Workflow

```bash
# Create branch
git checkout -b feature/xxx

# Sync with main
git fetch origin
git rebase origin/main

# Create PR
gh pr create
```

## Cautions

- Avoid `git push --force` (use `--force-with-lease` instead)
- Use `git reset --hard` carefully
- Never commit `.env` or credentials
