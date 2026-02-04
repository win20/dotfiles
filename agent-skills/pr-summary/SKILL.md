---
name: pr-summary
description: Generate pull request summaries and open GitHub PRs from the current branch’s git changes.
---

# PR Summary

## Workflow

1. Analyze changes with git:
   - `git log main..HEAD --oneline`
   - `git diff main...HEAD --stat`
   - If needed for clarity, read the full diff with `git diff main...HEAD`.
2. Draft a conventional-commit title:
   - Format: `<type>(<scope>): <summary> (<ticket>)`
   - Examples:
     - `feat(profile): add blocking feature (HAE-111)`
     - `fix(onboarding): correct next button target path (HAE-222)`
   - If the ticket id or scope is unclear, ask for it before finalizing the title.
3. Generate a PR body with the exact structure below. Keep it concise, no extra text, and no “Generated with …” lines.
4. Create the PR using `gh pr create` with the title and body.

## PR Body Template

```markdown
## Summary

- [1-3 bullets describing the changes]

## Changes

- [Significant changes]
- [Files modified: list paths or key files]
- [Breaking changes, if any]

## Dependencies

- [Dependencies added or updated]

## Testing Notes

- [How to test these changes (ommit if not needed or if simple change)]
```

## Notes

- Keep all content factual and derived from the diff/log.
- If there are no breaking changes or dependencies, write `None` rather than omitting the line.
