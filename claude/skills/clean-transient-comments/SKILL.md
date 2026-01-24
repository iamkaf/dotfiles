---
name: Clean Transient Comments
description: This skill should be used when the user asks to "clean transient comments", "remove temporary comments", "clean up commit message comments", "remove conversational comments", "clean development comments", or asks to remove comments that describe past changes rather than documenting what the code does.
version: 1.0.0
---

Scan the project and identify transient/conversational comments that were left during previous development sessions. These are comments that read like explanations of what was changed rather than documentation of what the code does.

## When to Use

Invoke this skill when the codebase contains comments like:
- "// This is now done via mixin"
- "// Reduced but still accommodate icons"
- "// Moved to ItemFunctions.java"
- "// Updated to use new API"
- "// Fixed per review comments"
- "// Changed from X to Y"

These are artifacts of development that have no ongoing value.

## Comments to Remove

Comments that describe past changes or refactors:
- Explain where code moved from/to
- Feel like commit messages embedded in code
- Start with past tense verbs or phrases like "now", "moved", "changed", "updated", "fixed"

Examples:
- "// This is now done via mixin" → Remove
- "// Updated to use new API" → Remove
- "// Changed from X to Y" → Remove
- "// Moved from utils.js to helpers.js" → Remove

## Comments to Keep

Preserve comments that:
- Explain WHY code works a certain way
- Document non-obvious logic or algorithms
- Provide warnings about edge cases
- Reference tickets/issues (e.g., "// TODO: Fix issue #123")
- Document TODO items that are still relevant
- Describe business logic or domain-specific knowledge

## Process

### Phase 1: Scan

Scan the project (or specified paths) for transient comments.

**If no paths provided:** Scan common source directories (src/, lib/, **/*.js, **/*.ts, **/*.py, etc.)

### Phase 2: Report (Always)

Before making changes, present a report with:
- Files containing transient comments
- Specific comments planned for removal with surrounding context
- Rationale for each removal

**Always wait for approval before proceeding to Phase 3.**

### Phase 3: Remove (After Approval)

After approval, remove the identified comments and report what was cleaned.

Preserve all code structure and formatting—only remove the comment lines themselves.
