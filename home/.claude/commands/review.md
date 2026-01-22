---
description: Code review local git changes
disable-model-invocation: true
ARGUMENTS: [file-or-folder-to-review]
---

ARGUMENTS: $ARGUMENTS (optional file or directory paths to scope the review).
TASK: orchestrate a code review of recent changes by invoking the `code-reviewer` agent with the correct instructions.

If no arguments are passed:
- run a git diff to gather current local changes -> invoke the `code-reviewer` agent and give it these changes to review.

If arguments are passed, and it's one or more files or folders:
- give those files for the `code-reviewer` to review, and only those files.

If arguments are passed, and it's just a number, eg: "1", "2" or "3", then get the changes for the last N commits:
- get the diffs for those commits only and pass in those changes to the `code-reviewer` agent.

The agent will then output the code review which you will write to `.agent/reviews/{dd-mm-yyy-feature-name}`