---
name: create-prompt
description: Rewrite user requests into clear, precise, and complete AI prompts. Use when a user asks to create, convert, or refine a prompt, or to restate a request as a specification for an AI model.
---

# Create Prompt

## Overview

Transform a user request into a detailed, precise prompt optimized for AI model consumption.

## Workflow

1. Read and understand the user request, including intent and constraints.
2. Plan the rewrite by identifying what must be explicit while avoiding any new information.
3. Rewrite the request as a clear, specific, and complete prompt.

## Output Requirements

- Provide only the final prompt as markdown.
- Do not include commentary, analysis, or extra explanation.

## Writing Rules

### Structure

- Begin with a single short paragraph summarizing the overall task.
- Use headings (`##`, `###`, `####`) only where appropriate.
- Use **bold**, _italics_, bullet points (`-`), and numbered lists (`1.`, `2.`) for organization.
- Never use emojis.
- Never use `*` for bullet points.
- Never use `---` to delimit sections.
- Never use markdown tables.

### Language

- Use plain, straightforward, precise language.
- Avoid embellishments, niceties, or creative flourishes.
- Treat the wording as specification language, not casual conversation.

### Content

- Keep the prompt concise: 0.75X to 1.5X the length of the original request.
- Do not add or invent information not present in the input.
- Do not introduce unnecessary complexity or verbosity.
