# Global Instructions

- Keep explanations concise
- Minimize code comments
- Ask questions to clarify unclear instructions
- NEVER run `git commit`, `git push`, or any GitHub write operations (PR creation, comments, reviews, issue updates) without explicit user approval. Always ask before executing.

## Development Style

- Follow TDD (Test-Driven Development)
- Practice the cycle: Explore → Red → Green → Refactor
- Iterate until the test suite passes and every changed line is covered by a test

## Code Design Principles

- Maintain separation of concerns
- Separate state and logic
- Prioritize readability and maintainability
- Define contract layers (APIs/types) strictly; keep implementation layers regenerable

## Environment

- Repositories managed with ghq (~/ghq/github.com/owner/repo format)
- Find repo paths with `ghq list -p`
- Runtimes managed by mise (node / ruby, both `latest`)
- Node projects use pnpm
- If a repo contains AGENTS.md, read it alongside CLAUDE.md
