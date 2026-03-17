---
name: plan-file
description: Create thorough implementation plans for complex tasks. Use only when told explicitly to write plan to file.
---

# Deep Plan

## Overview

Produce a detailed, actionable, and self-contained implementation plan, then save it into the project at `.agents.local/plans/` using a date-prefixed filename or a phased folder structure.

## Workflow

1. **Gather context**
   - Read relevant files to understand existing structure, conventions, and dependencies.
   - Note any constraints (tech stack, lint rules, coding conventions).

2. **Clarify missing requirements**
   - If anything is ambiguous or risky, ask clarifying questions before planning.

3. **Generate the plan**
   - Apply the guidelines from `./references/guidelines.md` to create the plan
   - The guidelines specify the required format, process, and best practices

4. **Save the plan**
   - Write to `.agents.local/plans/<DD-MM-YYYY>-<feature-slug>.md`
   - If the plan contains multiple big phases, create `.agents.local/plans/<DD-MM-YYYY>-<feature-slug>/phase-1.md`, `phase-2.md`, etc.

## Naming Rules

- Use date prefix in DD-MM-YYYY format
- Use a short, lowercase, hyphenated feature slug (e.g., `03-02-2026-profile-onboarding.md`)
- Keep file names ASCII
