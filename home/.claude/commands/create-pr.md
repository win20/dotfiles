---
description: Generate a summary for the current branch changes
allowed-tools: Bash(git:*)
---

# PR Summary

- Generate a pull request summary for the current branch.
- NEVER add any unnecessary text like "Generated with..."
- Structure the summary in a clear and concise way, no unnecessary emojis.
- Title should be in conventional commit format:
  - "feat(profile): add blocking feature (HAE-111)"
  - "fix(onboarding): correct next button target path (HAE-222)"

## Instructions

1. **Analyze changes**:

   ```bash
   git log main..HEAD --oneline
   git diff main...HEAD --stat
   ```

2. **Generate summary** with:

   - Brief description of what changed
   - List of files modified
   - Breaking changes (if any)
   - Testing notes

3. **Format as PR body**:

   ```markdown
   ## Summary

   [1-3 bullet points describing the changes]

   ## Changes

   - [List of significant changes]

   ## Dependencies

   - [List any dependencies that were added]
   ```

4. Create a pull request using `gh pr create`
