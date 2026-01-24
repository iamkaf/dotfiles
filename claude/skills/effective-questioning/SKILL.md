---
name: effective-questioning
description: This skill should be used when the user asks to "ask me questions", "gather requirements", "understand what I want", "help me clarify my needs", or when the user's request is vague, ambiguous, or needs deeper understanding before proceeding with implementation.
version: 0.1.0
---

# Effective Questioning

This skill provides guidance for gathering comprehensive requirements and understanding user needs through strategic questioning.

## Purpose

Use this skill when a user's request needs clarification, exploration, or deeper understanding before taking action. Effective questioning prevents wasted work, misalignment, and the need for extensive rework.

## When to Use This Skill

Invoke this skill when:

- User says "ask me questions" or "help me figure out what I need"
- Request is vague or ambiguous (e.g., "make it faster", "improve the UI")
- Multiple valid approaches exist and the best one is unclear
- User preferences will significantly impact the solution
- Task scope is undefined or could be interpreted multiple ways
- User seems uncertain about what they want
- Complex task with many interconnected decisions

**Do NOT use this skill** when:
- Request is clear and specific (e.g., "fix the typo on line 42")
- Simple, unambiguous task
- User has already provided comprehensive requirements
- Emergency/time-critical situation where action is needed immediately

## Key Guidelines

- **Always use AskUserQuestion** - Never ask questions in plain text when you could use the tool
- **Ask 3-4 questions per round** - Enough to gather information, not overwhelm
- **Build on previous answers** - Reference what the user told you to show understanding
- **Include "Other" option** - Let users provide custom input when options don't fit
- **Use multiple rounds** - One round is rarely enough for complex tasks
- **Confirm before acting** - Summarize understanding and get approval before proceeding
- **Stop when clear** - You have enough info when implementation path is obvious

## Quick Reference

| Scenario | First Round Questions | Target Rounds |
|----------|----------------------|---------------|
| New feature | Problem, users, timeline, priorities | 3-4 rounds |
| Vague request | Goal, context, constraints, preferences | 3-4 rounds |
| Bug fix | Reproduction, environment, frequency, impact | 2-3 rounds |
| Research | Goal, starting level, depth, sources | 3-4 rounds |
| Planning | Scope, timeline, resources, success criteria | 3-4 rounds |
| Learning | Current level, goals, timeline, style | 2-3 rounds |

**Question Flow:**
```
Round 1: Big picture (3-4 questions)
   ↓
Round 2: Details based on Round 1 (3-4 questions)
   ↓
Round 3: Refinement (2-3 questions, if needed)
   ↓
Round 4: Confirmation (1-2 questions)
   ↓
Proceed with implementation
```

## FIRST: Assess If Questioning Is Needed

Before using AskUserQuestion, quickly assess:

**Ask yourself:**
- Is the request clear and specific? → **No questioning needed**
- Do I understand what success looks like? → **May need confirmation**
- Are there multiple valid approaches? → **Use AskUserQuestion**
- Will user preferences significantly impact the solution? → **Use AskUserQuestion**
- Is the task scope undefined? → **Use AskUserQuestion**

**If yes to any of the last three, proceed with AskUserQuestion immediately.**

### Phase 1: Context Gathering (Big Picture)

Start broad to understand the overall situation:

**About the Problem:**
- What problem are you trying to solve?
- What's the current situation vs. desired situation?
- Why is this important to you right now?
- What happens if this doesn't get done?

**About the Context:**
- What system/codebase are we working with?
- Who are the users/audience?
- What are the constraints (time, budget, technical)?
- What's your technical comfort level?

### Phase 2: Specific Requirements (Details)

Dive into specifics of what's needed:

**Functional Requirements:**
- What specifically should this do?
- What are the key features?
- What inputs and outputs are expected?
- What edge cases need handling?

**Non-Functional Requirements:**
- Performance requirements?
- Accessibility needs?
- Browser/device support?
- Security considerations?

**User Experience:**
- Who will use this?
- How will they interact with it?
- What should the experience feel like?
- Any existing examples/patterns to follow?

### Phase 3: Constraints & Preferences (Boundaries)

Understand what's fixed vs. flexible:

**Technical Constraints:**
- Any technologies you must use?
- Any technologies you must avoid?
- Integration requirements?
- Deployment environment?

**Personal Preferences:**
- Simple vs. comprehensive solution?
- Quick hack vs. polished implementation?
- Any patterns/styles you prefer?
- Anything you explicitly don't want?

**Scope Boundaries:**
- What's in scope for this task?
- What's explicitly out of scope?
- Should this be Phase 1 of something larger?
- Are there related tasks to tackle separately?

### Phase 4: Validation (Confirm Understanding)

Ensure you've understood correctly:

- Summarize what you heard
- Ask for confirmation or correction
- Identify any remaining gaps
- Propose next steps for approval

## Question Types

### Open-Ended Questions

Encourage detailed responses:

- "Can you walk me through..."
- "What does success look like for..."
- "How do you envision..."
- "Tell me more about..."

### Specific Questions

Get precise information:

- "Which specific file should..."
- "What exact behavior when..."
- "Should this work with X or Y..."
- "Do you prefer option A or B..."

### Scenario-Based Questions

Test understanding with concrete situations:

- "What should happen when a user..."
- "If the API returns an error, then..."
- "When the screen is smaller than..."
- "If someone has never seen this before..."

### Priority Questions

Understand what matters most:

- "Which is more important: X or Y?"
- "If you could only have one feature, what would it be?"
- "What's the minimum viable version?"
- "What would be nice-to-have vs. must-have?"

### Example-Based Questions

Use examples to clarify:

- "Can you show me a similar system that works well?"
- "Do you have an example of the desired output?"
- "Is there an existing pattern in the codebase to follow?"
- "Can you point to where something similar exists?"

## Questioning Best Practices

### Start Broad, Then Narrow

```
Good: "What kind of web app are you building?" → "What framework?" → "Which component?"
Bad: Immediately jumping to implementation details
```

### Ask One Thing at a Time

```
Good: Separate questions, give user time to answer each
Bad: "What's your tech stack and who are your users and what's your timeline and..."
```

### Build on Previous Answers

```
Good: "You mentioned X - does that mean Y also applies?"
Bad: Asking disconnected questions without referencing previous answers
```

### Avoid Leading Questions

```
Good: "What approach do you prefer?"
Bad: "You want to use React, right?" (unless confirming understanding)
```

### Offer Options When Helpful

```
Good: "Would you prefer a quick solution or a more robust one?"
Bad: Always asking - sometimes just ask directly
```

### Confirm Understanding

```
Good: "So what I'm hearing is X - did I get that right?"
Bad: Assuming you understood without checking
```

## Handling Different User Types

### The Expert User

- Ask fewer, more targeted questions
- Focus on edge cases and constraints
- Respect their expertise
- Ask about preferences, not fundamentals

### The Novice User

- Ask more foundational questions
- Explain technical trade-offs
- Offer to guide decision-making
- Check for understanding

### The Uncertain User

- Offer options to help them clarify
- Use examples to make it concrete
- Suggest starting small and iterating
- Ask what they're confident about vs. unsure about

### The Busy User

- Ask the most critical questions first
- Offer quick options vs. deep exploration
- Summarize efficiently
- Respect their time

## PRIMARY METHOD: Use AskUserQuestion Extensively

**This skill requires extensive use of the `AskUserQuestion` tool.** This is the primary interface for effective questioning - use it repeatedly throughout the requirement gathering process.

### Why AskUserQuestion?

- **Structured**: Presents questions in a clean, organized format
- **Efficient**: Ask multiple related questions at once (2-4 per call)
- **User-friendly**: Easy for users to answer with clear options
- **Flexible**: Supports both multiple choice and "Other" for open-ended input
- **Trackable**: System records user answers for reference

### How to Use AskUserQuestion Effectively

**Always use AskUserQuestion for requirement gathering.** The pattern should be:

```
1. AskUserQuestion (Round 1) → Get initial context
2. AskUserQuestion (Round 2) → Deepen understanding based on Round 1
3. AskUserQuestion (Round 3) → Clarify remaining details
4. Confirm understanding → Proceed with implementation
```

### Best Practices

**Ask 2-4 related questions per call:**

```markdown
GOOD:
AskUserQuestion({
  questions: [
    "What's your technical background?",
    "What's your timeframe?",
    "What's most important to you?"
  ]
})

BAD:
Asking questions one at a time in plain text
```

**Group questions by theme:**

```markdown
Round 1: Context (problem, users, timeline)
Round 2: Technical details (stack, constraints, preferences)
Round 3: Scope and approach (MVP vs. full, risk tolerance)
Round 4: Confirmation and assumptions
```

**Use "Other" option for flexibility:**

Always include an "Other" option so users aren't constrained - let them provide custom input when options don't fit.

**Use multiSelect appropriately:**

When choices aren't mutually exclusive (e.g., "What browsers to support?"), use `multiSelect: true`.

**Build each round on previous answers:**

Reference what the user told you in previous rounds to show you're listening and to dive deeper.

### Example Flow

**Round 1 - Initial Context:**
```
AskUserQuestion:
- What problem are you solving?
- Who are the users?
- What's your timeline?
- What's most important: speed, quality, or cost?
```

**Round 2 - Technical Details:**
```
AskUserQuestion (building on Round 1):
- What's your current tech stack?
- Are there technical constraints?
- Do you prefer simple/quick or robust/comprehensive?
- Any technologies you must use or avoid?
```

**Round 3 - Scope & Approach:**
```
AskUserQuestion (building on Rounds 1-2):
- MVP first or full implementation?
- What's explicitly in/out of scope?
- Should this be part of a larger plan?
- Any existing patterns to follow?
```

**Round 4 - Confirmation:**
```
AskUserQuestion:
- Here's my understanding: [summary]. Is this correct?
- Any assumptions I should verify?
- Ready for me to proceed?
```

### Number of Questions

- **Round 1**: 3-4 questions (big picture)
- **Round 2**: 3-4 questions (details based on Round 1)
- **Round 3**: 2-3 questions (refinement, if needed)
- **Round 4**: 1-2 questions (confirmation)

**Total**: Typically 9-13 questions across 3-4 rounds of AskUserQuestion.

### When to Skip AskUserQuestion

Only skip AskUserQuestion when:
- User has already provided all necessary information
- Task is trivial/unambiguous (e.g., "fix typo on line 42")
- User explicitly says "stop asking, just do it"

**Otherwise, always use AskUserQuestion for clarification.**

## Common Questioning Patterns

### The "Five Whys" Approach

When understanding root causes:

1. "What do you need?" → "A login form"
2. "Why do you need that?" → "So users can save their data"
3. "Why do they need to save data?" → "To access it from multiple devices"
4. "Why multiple devices?" → "Our users work on desktop and mobile"
5. "So you need sync, not just login?" → "Exactly!"

### The MVP-First Pattern

For potentially large features:

1. "What's the minimum viable version?"
2. "What would you add in v2?"
3. "What's the ideal end state?"
4. "Which phase should we tackle first?"

### The Constraint-First Pattern

When technical feasibility is unclear:

1. "Are there any technical constraints?"
2. "What must you use vs. want to use?"
3. "Are there things you definitely can't use?"
4. "What's the deployment environment?"

### The Example-Gathering Pattern

When user has something in mind but can't articulate it:

1. "Can you show me something similar?"
2. "What do you like about that example?"
3. "What would you change about it?"
4. "Is there anything in your codebase like this?"

## Signs You Need to Ask More Questions

Stop and ask more questions when you notice:

- **Your own uncertainty**: You're not confident what to build
- **Multiple interpretations**: Request could mean several things
- **Missing context**: You don't understand the bigger picture
- **No clear success criteria**: You don't know what "done" looks like
- **User hesitation**: User seems unsure or pauses often
- **Complexity mismatch**: Simple request but complex implications (or vice versa)
- **New territory**: You haven't worked on similar tasks before
- **Scope creep**: Request keeps expanding

## When to Stop Asking

You have enough information when:

- User's answers are becoming redundant
- You have a clear implementation path
- Remaining details are minor/obvious
- User seems impatient or ready to proceed
- You've hit diminishing returns on questioning
- Core requirements are clear, edge cases can be handled as they come

## Transition to Action

Once requirements are clear:

1. Summarize what you understand
2. Propose an approach or plan
3. Identify any remaining assumptions
4. Ask for approval to proceed
5. Start implementation with confidence

## Common Mistakes to Avoid

### Asking Too Many Questions

```
Bad: 20 questions before doing anything
Good: 5-8 well-chosen questions, then proceed
```

### Asking Obvious Questions

```
Bad: "Do you want this to work?" (Yes, obviously)
Good: "What specifically should happen when..."
```

### Questioning in Isolation

```
Bad: Each question exists alone, doesn't build on previous answers
Good: Questions flow conversationally, reference previous context
```

### Ignoring User Expertise

```
Bad: Quizzing an expert on basics
Good: Respecting what user has already told you
```

### Faking Understanding

```
Bad: Saying "got it" when you don't
Good: "I'm not sure I understand - can you clarify..."
```

## Examples by Scenario

### For UI/UX Requests

Ask about:
- Target users and their technical comfort
- Existing designs/brands to follow
- Desktop vs. mobile vs. both
- Accessibility requirements
- Performance considerations
- Similar websites/apps they like
- What they want users to feel/do

### For Performance Tasks

Ask about:
- Current performance metrics (if known)
- What specifically is slow
- Target performance goals
- User impact of current performance
- Constraints (can't change X, must support Y)
- Trade-offs willing to make (cost, complexity, features)
- How performance will be measured

### For Refactoring

Ask about:
- Why the current approach is problematic
- What the ideal structure would be
- Tests that need to keep passing
- Risk tolerance for changes
- Timeline constraints
- Whether this is breaking or additive
- Patterns/architecture to follow

### For Feature Additions

Ask about:
- Who requested this and why
- Success criteria
- Edge cases to handle
- Similar existing features to learn from
- Integration points
- Rollback plan if needed
- Whether this is MVP or full-featured

### For Bug Fixes

Ask about:
- Steps to reproduce
- Expected vs. actual behavior
- Error messages or logs
- Browser/environment details
- Frequency (always, sometimes, rare)
- Impact severity
- Any recent changes that might have caused it

## Progressive Disclosure in Questioning

Don't ask everything at once. Use progressive disclosure:

1. **Round 1**: Big picture (3-4 questions)
2. **Round 2**: Key details (3-4 questions based on Round 1 answers)
3. **Round 3**: Edge cases and preferences (if needed)
4. **Round 4**: Confirmation and final checks (1-2 questions)

This prevents overwhelming the user while still gathering complete information.

## Additional Resources

### Reference Files

- **`references/question-patterns.md`** - Detailed question patterns by scenario
- **`examples/universal-scenarios.md`** - **Universal examples for non-development scenarios** including:
  - Skill creation
  - Writing & content creation
  - Knowledge management (Obsidian, note-taking)
  - Research & investigation
  - Planning & projects
  - Learning new topics
  - Decision making
  - Creative work & brainstorming
  - General troubleshooting

### Self-Check

Before proceeding, ask yourself:
- [ ] Do I understand the problem space?
- [ ] Do I know what success looks like?
- [ ] Are constraints clear?
- [ ] Do I know user preferences?
- [ ] Can I explain the plan back to the user?

If any answer is "no", ask more questions.

## Concrete AskUserQuestion Examples

### Example 1: Web Feature Request

**User says:** "I need a user dashboard"

**Round 1 - Understanding:**
```
AskUserQuestion:
  Q1: What's the primary purpose of this dashboard?
     - View data and analytics
     - Manage account settings
     - Monitor system status
     - Other (please describe)

  Q2: Who are the main users?
     - Technical users (developers, admins)
     - Non-technical users (business, customers)
     - Mixed audience
     - Other (please describe)

  Q3: What's your timeframe?
     - Urgent (needed this week)
     - Soon (needed this month)
     - Flexible (no hard deadline)
     - Other (please specify)

  Q4: What's most important?
     - Ship quickly with basic functionality
     - Build comprehensive feature set
     - Focus on polished UX/UI
     - Other (please describe)
```

**Round 2 - Technical Details:**
```
AskUserQuestion:
  Q1: What's your current tech stack?
     - React + Node.js
     - Vue + Laravel
     - Next.js
     - Other (please describe)

  Q2: Any technical constraints?
     - Must support IE11
     - Must use existing design system
     - Must integrate with specific APIs
     - No major constraints

  Q3: Do you have examples of dashboards you like?
     - Yes (link or describe)
     - No, you decide the design
     - Follow our existing app's style
```

### Example 2: Performance Issue

**User says:** "My app is slow, fix it"

**Round 1 - Diagnosis:**
```
AskUserQuestion:
  Q1: What specifically feels slow?
     - Initial page load
     - Interactions (clicks, form submissions)
     - API responses
     - Everything
     - Other (please describe)

  Q2: When did this start?
     - Always been slow
     - After recent changes
     - Gradually got worse over time
     - Other (please explain)

  Q3: What's your target improvement?
     - Just make it noticeably better
     - Specific performance metric in mind
     - Match competitor performance
     - Other (please specify)
```

**Round 2 - Technical Context:**
```
AskUserQuestion:
  Q1: What parts of the stack can we modify?
     - Frontend only
     - Backend only
     - Database only
     - Full stack
     - Other (please specify constraints)

  Q2: What's your effort tolerance?
     - Quick wins only (low-hanging fruit)
     - Comprehensive overhaul
     - Balanced approach
     - Other (please describe)

  Q3: Any existing profiling or metrics?
     - Yes, have performance data
     - No, we're flying blind
     - Some basic metrics
```

### Example 3: "I'm Not Sure What I Need"

**User says:** "I want to improve my app but not sure how"

**Round 1 - Discovery:**
```
AskUserQuestion:
  Q1: What's your app's main purpose?
     - E-commerce/store
     - SaaS/B2B application
     - Content/media site
     - Internal tool
     - Other (please describe)

  Q2: What's bothering you most right now?
     - Performance is slow
     - UI/UX feels dated
     - Hard to add new features
     - Users are complaining
     - Other (please describe)

  Q3: What's your goal?
     - Prepare for funding/growth
     - Improve user satisfaction
     - Make development easier
     - Fix specific issues
     - Other (please describe)
```

**Round 2 - Prioritization:**
```
AskUserQuestion:
  Q1: If you could only fix ONE thing, what would it be?
     - Performance
     - Design/appearance
     - User experience flow
     - Code quality/maintainability
     - Other (please specify)

  Q2: What's your budget/timeframe?
     - Need quick wins this week
     - Have a month for improvements
     - Ongoing gradual improvements
     - Other (please describe)

  Q3: Are there examples of apps you admire?
     - Yes, I have examples
     - No, you guide me
     - I know what I don't want
```

### Example 4: API Design

**User says:** "I need an API for user authentication"

**Round 1 - Requirements:**
```
AskUserQuestion:
  Q1: What auth methods do you need?
     - Email/password
     - OAuth (Google, GitHub, etc.)
     - Magic link/emailless
     - Other (please describe)

  Q2: What's the scale?
     - Personal project (hundreds of users)
     - Startup (thousands of users)
     - Enterprise (millions of users)
     - Other (please specify)

  Q3: What tokens do you prefer?
     - JWT
     - Session cookies
     - API keys
     - You decide based on best practices
```

### Key Patterns in Examples

1. **Always start with 3-4 questions** - not too many, not too few
2. **Include "Other" option** - capture unanticipated answers
3. **Build on previous answers** - each round deepens understanding
4. **Ask about constraints** - what's fixed vs. flexible
5. **Ask about priorities** - what matters most to the user
6. **Confirm before proceeding** - summarize understanding

**Remember**: The goal is to understand what the user wants before taking action. Use AskUserQuestion repeatedly until you have confidence to proceed.
