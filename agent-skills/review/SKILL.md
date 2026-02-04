---
name: review
description: Code reviews of git changes. Use when the user asks to review uncommitted changes, review the current branch against main, or review the last N commits.
---

# Code Review

## Overview

Orchestrate a local code review by collecting diffs and producing a structured review with clear priorities and fixes. Keep everything self-contained in this skill file.

## Workflow

1. Determine scope from the user request: uncommitted, against main, or last N commits.
2. Collect diffs with the git commands for the selected scope (see Diff Commands).
3. Review only the modified files and changes in scope.
4. Write the review markdown to `.agent/reviews/{dd-mm-yyyy}-{branch-name}.md`.

## Scope Rules

- "review my changes": review uncommitted changes (unstaged and staged).
- "review my changes against main": review `main...HEAD` (fall back to `origin/main...HEAD` if needed).
- "review my last N commits": review `HEAD~N..HEAD` with recent log context.

## Diff Commands

Uncommitted changes (unstaged + staged):
- `git status -sb`
- `git diff`
- `git diff --cached`

Against main:
- `git diff main...HEAD`
- If `main` is missing locally: `git diff origin/main...HEAD`
- Optional context: `git log --oneline main..HEAD`

Last N commits:
- `git log -n <N> --oneline`
- `git diff HEAD~<N>..HEAD`

## Output Rules

- Do not open or create PRs.
- Always store the review file; create `.agent/reviews` if missing.
- Use the current branch name from `git rev-parse --abbrev-ref HEAD`, replacing `/` with `-` in the filename.
- Keep the output clear and structured. Avoid emojis.
- Include relevant code snippets for context (3-7 lines showing the issue).
- Reference specific `CLAUDE.md` files and quotes when applicable.

## Review Checklist

- Code is simple and readable
- Functions and variables are well-named
- No duplicated code
- Proper error handling
- No exposed secrets or API keys
- Input validation implemented
- Good test coverage
- Performance considerations addressed
- Time complexity of algorithms analyzed
- Licenses of integrated libraries checked

## Security Checks (CRITICAL)

- Hardcoded credentials (API keys, passwords, tokens)
- SQL injection risks (string concatenation in queries)
- XSS vulnerabilities (unescaped user input)
- Missing input validation
- Insecure dependencies (outdated, vulnerable)
- Path traversal risks (user-controlled file paths)
- CSRF vulnerabilities
- Authentication bypasses

## Code Quality (HIGH)

- Large functions (>50 lines)
- Large files (>800 lines)
- Deep nesting (>4 levels)
- Missing error handling (try/catch)
- console.log statements
- Mutation patterns
- Missing tests for new code

## Performance (MEDIUM)

- Inefficient algorithms (O(n^2) when O(n log n) possible)
- Unnecessary re-renders in React
- Missing memoization
- Large bundle sizes
- Unoptimized images
- Missing caching
- N+1 queries

## Best Practices (MEDIUM)

- Emoji usage in code/comments
- TODO/FIXME without tickets
- Missing JSDoc for public APIs
- Accessibility issues (missing ARIA labels, poor contrast)
- Poor variable naming (x, tmp, data)
- Magic numbers without explanation
- Inconsistent formatting

## Review Output Format

For each issue:

```
[CRITICAL] Hardcoded API key
File: src/api/client.ts:42
Issue: API key exposed in source code
Fix: Move to environment variable

const apiKey = "sk-abc123";  // ❌ Bad
const apiKey = process.env.API_KEY;  // ✓ Good
```

## Approval Criteria

- ✅ Approve: No CRITICAL or HIGH issues
- ⚠️ Warning: MEDIUM issues only (can merge with caution)
- ❌ Block: CRITICAL or HIGH issues found
