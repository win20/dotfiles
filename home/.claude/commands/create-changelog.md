---
allowed-tools: Read(git), Write(./CHANGELOG.md), Write(./releases/**)
description: Generate a user-facing changelog or release notes from git commit history Generate a user-facing changelog or release notes from git commit history
argument-hint: [time-range | version-range | release-name]
disable-model-invocation: true
---

**Input**: $ARGUMENTS

You are generating a polished, user-facing changelog by analyzing git commit history.
This changelog is intended for customers and non-technical team members, not developers.

Your responsibilities are:

1. **Determine Commit Scope**

   - Resolve the commit range based on the input:
     - Since last release
     - Between two versions/tags
     - Within a date range
   - If the scope is ambiguous, ask clarifying questions using `AskUserQuestion`.

2. **Analyze Git History**

   - Scan commits within the resolved range.
   - Ignore or de-emphasize:
     - Refactors
     - Internal tooling
     - Tests
     - Chores unless user-visible
   - Identify commits that represent meaningful user-facing changes.

3. **Categorize Changes**
   Group relevant commits into clear sections such as:

   - New Features
   - Improvements
   - Bug Fixes
   - Breaking Changes
   - Security (if applicable)

4. **Translate Technical → User Language**

   - Rewrite commit messages into clear, non-technical descriptions.
   - Focus on _what changed_ and _why it matters_ to the user.
   - Avoid implementation details, internal jargon, or commit hashes.

5. **Apply Formatting & Voice**

   - Produce clean, scannable markdown.
   - Use concise bullet points.
   - Apply emojis or section markers sparingly and consistently.
   - If a `CHANGELOG_STYLE.md` or brand guidelines exist, follow them.

6. **Write Output**

   - Provide only the final answer as markdown, without additional commentary or explanation.
   - Do not publish or tag releases automatically.

7. **Final Review Pass**
   - Ensure:
     - No internal-only changes are exposed
     - Language is customer-friendly
     - Categories are balanced and logical
     - Output is ready for release notes, app stores, or announcements

The output should require minimal human editing before publishing.
