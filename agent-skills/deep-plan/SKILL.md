---
name: deep-plan
description: Create thorough implementation plans for complex tasks and save them into `.agent/plans/` within the current project. Use when the user asks for deep planning.
---

# Deep Plan

## Overview

Produce a detailed, actionable implementation plan, then save it into the project at `.agent/plans/` using a date-prefixed filename or a phased folder structure.

## Workflow

1. **Gather context**

   - Read relevant files to understand existing structure, conventions, and dependencies.
   - Note any constraints (tech stack, lint rules, coding conventions).

2. **Clarify missing requirements**

   - If anything is ambiguous or risky, ask concise clarifying questions before planning.

3. **Generate the plan**

   - If a planning subagent is available, use it. Otherwise, create the plan directly.
   - Follow the required plan format and style rules below.

4. **Save the plan**
   - Write to `.agent/plans/<DD-MM-YYYY>-<feature-slug>.md`.
   - If multiple phases require separate files, create `.agent/plans/<DD-MM-YYYY>-<feature-slug>/phase-1.md`, `phase-2.md`, etc.

## Plan Format

Use this structure and keep it concise but thorough. Do not use emojis, markdown tables, or `---`. Use `-` for bullets (never `*`).

```markdown
# Implementation Plan: <Feature Name>

## Overview

<2-3 sentence summary>

## Requirements

- <Requirement 1>
- <Requirement 2>

## Architecture Changes

- <Change 1: file path and description>
- <Change 2: file path and description>

## Implementation Steps

### Phase 1: <Phase Name>

1. **<Step Name>** (File: path/to/file.ts)

   - Action: <specific action>
   - Why: <reason>
   - Dependencies: <None or step refs>
   - Risk: <Low/Medium/High>

2. **<Step Name>** (File: path/to/file.ts)
   ...

### Phase 2: <Phase Name>

...

## Testing Strategy

- Unit tests: <files to test>
- Integration tests: <flows to test>
- E2E tests: <user journeys to test>

## Risks & Mitigations

- **Risk**: <description>
  - Mitigation: <how to address>

## Success Criteria

- [ ] <criterion 1>
- [ ] <criterion 2>
```

## Naming Rules

- Use date prefix in `DD-MM-YYYY`.
- Use a short, lowercase, hyphenated feature slug (e.g., `03-02-2026-profile-onboarding.md`).
- Keep file names ASCII.
