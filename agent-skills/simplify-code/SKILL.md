---
name: simplify-code
description: Simplify and clarify existing code without changing behavior.
---

# Simplify Code

## Overview

Simplify the specified code for clarity and maintainability while preserving exact behavior.

## Workflow

1. Identify the exact scope from $ARGUMENTS; ignore unrelated files or sections.
2. Read the relevant project standards (e.g., `CLAUDE.md`, `AGENTS.md`, coding conventions) and follow them.
3. Refactor only within scope to reduce complexity and improve clarity without changing behavior.
4. Avoid stylistic churn; keep changes minimal and purposeful.
5. Report changes and their impact concisely.

## Standards to Apply

- Use ES modules with sorted imports and explicit extensions when required by the project.
- Prefer `function` declarations over arrow functions for top-level functions.
- Add explicit return type annotations to top-level functions.
- Use explicit `Props` types for React components.
- Prefer clear control flow; avoid nested ternary operators.
- Maintain naming conventions and casing rules.
- Use explicit types; never use `any`.
- Avoid unnecessary try/catch; follow project error-handling patterns.

## Clarity Guidelines

- Reduce unnecessary nesting and branching.
- Remove redundant abstractions and duplicated logic.
- Choose clear, descriptive names over cleverness.
- Prefer explicit, readable code over dense one-liners.
- Remove comments that restate obvious code.

## Guardrails

- Do not change observable behavior, outputs, or side effects.
- Do not merge unrelated concerns or over-simplify abstractions.
- Do not expand scope beyond $ARGUMENTS.

## Output

- Summarize what changed and why it is clearer.
- Call out any assumptions or standards referenced.
