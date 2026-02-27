---
name: git-commit
description: Execute git commit with conventional commit message analysis, intelligent staging, and message generation. Use whenever commiting changes to git.
allowed-tools: Bash
---

# Git Commit with Conventional Commits

## Overview

Create standardized, semantic git commits using the Conventional Commits specification. Analyze the actual diff to determine appropriate type, scope, and message.

## Conventional Commit Format

```
<type>[optional scope]: <short description> [ticket-number]

[optional body]

[optional footer(s)]
```

## Commit Types

| Type       | Purpose                        |
| ---------- | ------------------------------ |
| `feat`     | New feature                    |
| `fix`      | Bug fix                        |
| `docs`     | Documentation only             |
| `style`    | Formatting/style (no logic)    |
| `refactor` | Code refactor (no feature/fix) |
| `perf`     | Performance improvement        |
| `test`     | Add/update tests               |
| `build`    | Build system/dependencies      |
| `ci`       | CI/config changes              |
| `chore`    | Maintenance/misc               |
| `revert`   | Revert commit                  |

## Workflow

### 1. Analyze Diff

```bash
# If files are staged, use staged diff
git diff --staged

# If nothing staged, use working tree diff
git diff

# Also check status
git status --porcelain
```

### 2. Stage Files (if needed)

If user asks you to group changes

```bash
# Stage specific files
git add path/to/file1 path/to/file2

# Stage by pattern
git add *.test.*
git add src/components/*

# Interactive staging
git add -p
```

**Never commit secrets** (.env, credentials.json, private keys).

### 3. Generate Commit Message

Analyze the diff to determine:

- **Type**: What kind of change is this?
- **Scope**: What area/module is affected?
- **Description**: One-line summary of what changed (present tense, imperative mood, <72 chars)

### 4. Execute Commit

```bash
# Single line
git commit -m "<type>[scope]: <description> [ticket-number]"

# Multi-line with body/footer
git commit -m "$(cat <<'EOF'
<type>[scope]: <description> [ticket-number]

<optional body>

<optional footer>
EOF
)"
```

### 5. Example commit

```
feat(tabs): add animation for message count badge (HAE-123)

- Use subtle scale animation
- Smoother experience, better than the badge instantly appearing
```

## Best Practices

- One logical change per commit
- Present tense: "add" not "added"
- Imperative mood: "fix bug" not "fixes bug"
- Reference issue with suffix: (HAE-111)
  - you can find this in branch name
  - if it's not in the branch name, skip adding the ticket number
- Keep description under 72 characters
- Don't add explanations in the description, just concise summary of what was done
- Use body for explanations of why and how the change was done if it isn't obvious, use `-` style bullet points
- Just commit, don't push

## Git Safety Protocol

- NEVER update git config
- NEVER run destructive commands (--force, hard reset) without explicit request
- NEVER skip hooks (--no-verify) unless user asks
- NEVER force push to main/master
- If commit fails due to hooks, fix and create NEW commit (don't amend)
