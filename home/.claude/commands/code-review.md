---
allowed-tools: Bash(git *)
description: Code review local git changes
disable-model-invocation: true
ARGUMENTS: [file-or-folder-to-review]
model: claude-opus-4-5
---

Provide a code review for local git changes.

Arguments: $ARGUMENTS (optional file or directory paths to scope the review)

To do this, follow these steps precisely:

1. Use a Haiku agent to check the git diff scope:
   a. If $ARGUMENTS is provided, use `git diff $ARGUMENTS` to get changes for only those specific files/directories
   b. If $ARGUMENTS is empty, use `git diff` to get all unstaged changes, or `git diff --staged` if there are no unstaged changes
   c. If there are no changes to review, stop and inform the user
   d. If the changes are trivial (e.g., only whitespace, comments, or version bumps), stop and inform the user
2. Use another Haiku agent to give you a list of file paths to (but not the contents of) any relevant CLAUDE.md files from the codebase: the root CLAUDE.md file (if one exists), as well as any CLAUDE.md files in the directories whose files were modified in the diff
3. Use a Haiku agent to summarize the changes from the git diff
4. Then, launch 5 parallel Sonnet agents to independently code review the changes. The agents should do the following, then return a list of issues and the reason each issue was flagged (eg. CLAUDE.md adherence, bug, historical git context, etc.):
   a. Agent #1: Audit the changes to make sure they comply with the CLAUDE.md. Note that CLAUDE.md is guidance for Claude as it writes code, so not all instructions will be applicable during code review.
   b. Agent #2: Read the file changes in the git diff, then do a shallow scan for obvious bugs. Avoid reading extra context beyond the changes, focusing just on the changes themselves. Focus on large bugs, and avoid small issues and nitpicks. Ignore likely false positives.
   c. Agent #3: Read the git blame and history of the code modified, to identify any bugs in light of that historical context
   d. Agent #4: Read previous commits that touched these files (use `git log -p -- <file>`), and check for any patterns or issues that may also apply to the current changes.
   e. Agent #5: Read code comments in the modified files, and make sure the changes comply with any guidance in the comments.
5. For each issue found in #4, launch a parallel Haiku agent that takes the diff, issue description, and list of CLAUDE.md files (from step 2), and returns a score to indicate the agent's level of confidence for whether the issue is real or false positive. To do that, the agent should score each issue on a scale from 0-100, indicating its level of confidence. For issues that were flagged due to CLAUDE.md instructions, the agent should double check that the CLAUDE.md actually calls out that issue specifically. The scale is (give this rubric to the agent verbatim):
   a. 0: Not confident at all. This is a false positive that doesn't stand up to light scrutiny.
   b. 25: Somewhat confident. This might be a real issue, but may also be a false positive. The agent wasn't able to verify that it's a real issue. If the issue is stylistic, it is one that was not explicitly called out in the relevant CLAUDE.md.
   c. 50: Moderately confident. The agent was able to verify this is a real issue, but it might be a nitpick or not happen very often in practice. Relative to the rest of the changes, it's not very important.
   d. 75: Highly confident. The agent double checked the issue, and verified that it is very likely it is a real issue that will be hit in practice. The existing approach in the changes is insufficient. The issue is very important and will directly impact the code's functionality, or it is an issue that is directly mentioned in the relevant CLAUDE.md.
   e. 100: Absolutely certain. The agent double checked the issue, and confirmed that it is definitely a real issue, that will happen frequently in practice. The evidence directly confirms this.
6. Filter out any issues with a score less than 80. If there are no issues that meet this criteria, inform the user that no significant issues were found.
7. Present the results to the user in a clear, structured format (see below).

Examples of false positives, for steps 4 and 5:

- Issues that a linter, typechecker, or compiler would catch (eg. missing or incorrect imports, type errors, broken tests, formatting issues, pedantic style issues like newlines). No need to run these build steps yourself -- it is safe to assume that they will be run separately as part of CI.
- Lack of test coverage (unless explicitly required in CLAUDE.md)
- Issues that are called out in CLAUDE.md, but explicitly silenced in the code (eg. due to a lint ignore comment)
- Changes in functionality that are likely intentional or are directly related to the broader change

Notes:

- Do not check build signal or attempt to build or typecheck the app. These will run separately, and are not relevant to your code review.
- Make a todo list first
- You must cite each issue (eg. if referring to a CLAUDE.md, you must reference it with the specific quote)
- For your final output, follow the following format precisely (assuming for this example that you found 3 issues):

---

## Code Review Results

Reviewed: `git diff` (or `git diff <scope>` if arguments were provided)

Found 3 issues:

### 1. Missing error handling for OAuth callback
**Severity:** High (Confidence: 85)  
**File:** `src/auth.ts:67-72`  
**Reason:** CLAUDE.md says "Always handle OAuth errors"

```typescript
// Lines 67-72 from src/auth.ts
async function handleOAuthCallback(code: string) {
  const token = await exchangeCode(code);
  return token;
}
```

**Issue:** No error handling for the OAuth code exchange. This will crash if the exchange fails.

---

### 2. Memory leak: OAuth state not cleaned up
**Severity:** High (Confidence: 90)  
**File:** `src/auth.ts:88-95`  
**Reason:** Bug due to missing cleanup in finally block

```typescript
// Lines 88-95 from src/auth.ts
async function login() {
  const state = generateState();
  stateMap.set(state, Date.now());
  return redirectToOAuth(state);
}
```

**Issue:** OAuth state is stored in the map but never cleaned up, causing a memory leak over time.

---

### 3. Inconsistent naming pattern
**Severity:** Medium (Confidence: 82)  
**File:** `src/utils.ts:23-28`  
**Reason:** src/conventions/CLAUDE.md says "Use camelCase for functions"

```typescript
// Lines 23-28 from src/utils.ts
function parse_user_input(input: string) {
  return input.trim().toLowerCase();
}
```

**Issue:** Function uses snake_case instead of camelCase, inconsistent with codebase conventions.

---

- Or, if you found no issues:

---

## Code Review Results

Reviewed: `git diff` (or `git diff <scope>` if arguments were provided)

No significant issues found. Checked for bugs and CLAUDE.md compliance.

---

Additional guidelines:

- Keep your output clear and structured
- Avoid emojis
- Include relevant code snippets for context (3-7 lines showing the issue)
- Reference specific CLAUDE.md files and quotes when applicable
- Show file paths with line ranges (e.g., `src/auth.ts:67-72`)
- Group issues by severity if there are many
