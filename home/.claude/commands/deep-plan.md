---
allowed-tools: Edit(./.agent/plans/**), Write(./.agent/plans/**)
description: Create a thorough implementation plan for a specific task
argument-hint: [task-description]
disable-model-invocation: true
---

**Task**: $ARGUMENTS

You are orchestrating a deep, thorough plan for a potentially difficult task, I need you to:
1. Do some basic research and context gathering for the task at hand.
2. If anything is unsure, or you think of anything the use may have missed, ask clarifying questions using the `AskUserQuestion`.
3. When the initial requirements are clear, invoke the `planner` agent with that context and clear requirements.

The planner agent will then:
- Analyze the request and restate requirements in clear terms
- Break down into phases with specific, actionable steps
- Identify dependencies between components
- Assess risks and potential blockers
- Estimate complexity (High/Medium/Low)
- Present the plan

Take the plan that is presented to you and write it into a document at `.agent/plans/{dd-mm-yyy-feature-a}.md`
