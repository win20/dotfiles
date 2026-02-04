---
name: documentation
description: Create clear, concise technical documentation for a specified file, module, or folder.
---

# Documentation

## Overview

Write focused technical documentation for the scope in $ARGUMENTS and place it at the requested path.

## Workflow

1. Confirm scope and output path; default to `./docs/{sensible-name}.md` if not specified.
2. Read the target files or folders and identify audience, purpose, and key workflows.
3. Draft the doc using the standards below; prefer clarity over completeness when tradeoffs exist.
4. Include examples and troubleshooting when applicable.
5. Ensure formatting rules are met before final output.

## Writing Standards

- Use a logical hierarchy with consistent headings and a table of contents.
- Use simple language; define technical terms; avoid jargon.
- Provide working code samples with expected outputs when relevant.
- Include prerequisites, step-by-step instructions, and next steps.

## Best Practices

- Start with overview and scope.
- Use active voice and imperative mood.
- Add a troubleshooting section.
- Keep content version-specific and current for the target codebase.
- Never use emojis.
- Never use `*` for bullet points; always use `-`.
- Never use `---` to delimit sections.
- Never use markdown tables or other formatting meant to “prettify” the prompt.

## Format Guidelines

- Use Markdown consistently.
- Add syntax highlighting for code blocks.
- Add clear section breaks and navigation.
- Provide both a quick start and a detailed guide when applicable.

## Output

- Create or update the documentation file at the chosen path.
- Summarize what the doc covers and any assumptions.
