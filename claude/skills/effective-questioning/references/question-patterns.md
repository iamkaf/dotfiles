# Question Patterns by Scenario

Specific question patterns for common development scenarios.

## Web Development

### New Feature Addition

**Context Gathering:**
1. What problem does this feature solve for users?
2. Who is the primary user for this feature?
3. How did this feature request come about? (user feedback, business requirement, etc.)
4. Are there examples of similar features you like?

**Functional Details:**
5. What should happen when a user interacts with this feature?
6. What are the main inputs and outputs?
7. Are there different user states or permissions to consider?
8. What edge cases need handling? (empty states, errors, limits)

**Integration & Scope:**
9. How does this integrate with existing features?
10. What existing code/patterns should this follow?
11. Is there anything explicitly out of scope for this first version?
12. Should this be launched incrementally or all at once?

**Success Criteria:**
13. How will we know this feature is working as intended?
14. What metrics or feedback matter most?
15. What's the minimum viable version we can ship?

### UI/UX Design

**User Understanding:**
1. Who are the primary users? (technical level, domain knowledge)
2. What's their main goal when using this interface?
3. What devices/browsers will they use?
4. Are there accessibility requirements? (WCAG level, screen readers, keyboard navigation)

**Design Direction:**
5. Are there existing designs, brand guidelines, or design systems to follow?
6. What websites or apps have UX you admire? Why?
7. Should this feel simple/minimal or comprehensive/powerful?
8. What should the user feel when using this? (confident, excited, calm, etc.)

**Layout & Structure:**
9. What information hierarchy is most important?
10. What actions should be most prominent?
11. How should the layout adapt to different screen sizes?
12. Are there similar interfaces in the codebase to reference?

**Behavior:**
13. What should happen on error? (show message, retry, graceful degradation)
14. What loading states should users see?
15. How should users be guided if they're stuck?

### Performance Optimization

**Understanding the Problem:**
1. What specifically feels slow? (page load, interactions, database queries)
2. How are you measuring performance currently?
3. What's the target performance metric?
4. When did this become a problem? (always, after recent changes, gradual)

**Context & Constraints:**
5. What parts of the stack can we modify? (frontend, backend, database, infrastructure)
6. Are there technical constraints? (can't change X, must support Y)
7. What's the budget/effort level for this? (quick win vs. comprehensive overhaul)
8. What trade-offs are acceptable? (cost vs. speed, simplicity vs. optimization)

**Investigation:**
9. Have you profiled or measured where the bottleneck is?
10. What have you already tried?
11. Are there similar pages/features that are fast? What's different?

**Success:**
12. What performance improvement would make you happy?
13. How will we verify the improvement works in production?
14. Should we optimize for perceived performance or actual metrics?

### Refactoring

**Understanding the Pain:**
1. What makes the current approach difficult to work with?
2. What problems is this causing? (bugs, slow development, hard to understand)
3. How long has this been problematic?
4. Is this blocking other work?

**Desired State:**
5. What would the ideal structure look like?
6. What patterns or architecture should we follow?
7. Are there examples in the codebase that represent the target state?
8. What should be easier after the refactor?

**Constraints & Safety:**
9. What tests need to keep passing?
10. What's the risk tolerance for this change? (fearless vs. conservative)
11. Can this be done incrementally or does it need to be all at once?
12. Are there external dependencies or APIs that can't change?

**Scope:**
13. Is this just a code cleanup or a behavioral change?
14. What's explicitly out of scope?
15. Should we tackle the whole system or focus on the most painful parts?

### Bug Fix

**Reproduction:**
1. What steps do you take to see this bug?
2. What do you expect to happen vs. what actually happens?
3. Are there any error messages or console output?
4. Can you share a screenshot or recording?

**Context:**
5. When did this first appear? (always, after recent change, intermittently)
6. What browser/device/OS are you using?
7. Does this happen for all users or specific ones?
8. How frequently does this occur?

**Impact:**
9. How severe is this? (blocking, annoying, minor)
10. Who is affected? (all users, specific group, rare edge case)
11. Is there a workaround?
12. What's the urgency level?

**Investigation:**
13. What have you already tried to fix it?
14. Were there recent changes that might have caused this?
15. Are there similar features that work correctly?

## Backend/API

### API Endpoint Creation

**Functional Requirements:**
1. What resource does this API manage?
2. What operations are needed? (GET, POST, PUT, DELETE, etc.)
3. What are the request and response formats?
4. What validation is required?

**Authentication & Authorization:**
5. Who can access this API? (authenticated users, public, admin-only)
6. What permissions or roles are needed?
7. Should this be rate-limited?

**Error Handling:**
8. What errors might occur? How should they be surfaced?
9. What status codes should be returned?
10. How should validation errors be communicated?

**Integration:**
11. What database models or services does this interact with?
12. Are there similar endpoints to follow patterns from?
13. Should this be versioned?

### Database Schema Change

**Understanding the Need:**
1. What data are you trying to store or restructure?
2. Why is the current schema insufficient?
3. What queries or operations will this enable?
4. Are there performance implications?

**Migration Strategy:**
5. Is this a new table, modification to existing, or data migration?
6. Does existing data need to be migrated? How?
7. Can this be done with zero downtime?
8. What's the rollback plan if something goes wrong?

**Schema Design:**
9. What are the entities and relationships?
10. What indexes are needed?
11. What are the constraints? (unique, not null, foreign keys)
12. How will this be queried? (affects indexing and design)

**Testing:**
13. How will we verify the migration worked correctly?
14. Should we test on production data first?
15. What monitoring is needed after deployment?

## DevOps & Infrastructure

### Deployment Setup

**Understanding Requirements:**
1. What are we deploying? (web app, API, worker, etc.)
2. What's the target environment? (Vercel, AWS, bare metal, etc.)
3. What's the scale/traffic expectation?
4. What's the deployment frequency? (on commit, scheduled, manual)

**Technical Stack:**
5. What's the build process? (Node, Python, static site)
6. What dependencies need to be installed?
7. Are there environment-specific configurations?
8. What secrets need to be managed?

**Process:**
9. Should this be automated CI/CD or manual deployment?
10. What testing should happen before deploy?
11. What happens if deployment fails? (rollback strategy)
12. Who needs access/notifications?

**Monitoring:**
13. How will we know the deployment succeeded?
14. What health checks or monitoring are needed?
15. Are there alerts or logging requirements?

## Data & Analytics

### Data Pipeline/Processing

**Understanding Data:**
1. What data are we working with? (source, format, volume)
2. Where does it come from? (API, database, files, stream)
3. How fresh does the data need to be? (real-time, hourly, daily)
4. What's the data volume and growth rate?

**Processing Requirements:**
5. What transformations need to happen?
6. Are there validation or quality checks?
7. What happens to bad or invalid data?
8. Should this process data incrementally or in batches?

**Outputs:**
9. Where does the processed data go? (database, warehouse, API)
10. How is it consumed? (dashboard, API, reports)
11. What format should the output be in?

**Reliability:**
12. What happens if the pipeline fails? (retry, alert, skip)
13. How do we monitor data quality?
14. Is there a backfill strategy for historical data?

## Learning & Documentation

### Code Explanation Request

**Audience Assessment:**
1. What's your current familiarity with this codebase?
2. What's your technical background? (language experience, domain knowledge)
3. Are you looking for a high-level overview or detailed walkthrough?
4. What specifically is confusing?

**Explanation Approach:**
5. Would examples or analogies be helpful?
6. Should I explain the "why" or just the "how"?
7. Are there related concepts you already understand well?
8. Do you prefer code comments, separate documentation, or interactive explanation?

**Scope:**
9. Should I explain the entire system or focus on specific parts?
10. What level of detail is useful? (architecture, functions, lines of code)
11. Are there performance implications I should cover?

### Documentation Writing

**Understanding Purpose:**
1. Who is the audience? (future developers, users, stakeholders)
2. What should they be able to do after reading this?
3. What's their technical level?
4. When will they read this? (onboarding, troubleshooting, reference)

**Content Requirements:**
5. What needs to be documented? (architecture, API, setup, troubleshooting)
6. What examples would be most helpful?
7. Are there diagrams or visuals needed?
8. Should this include best practices or warnings?

**Format & Delivery:**
9. Where should this documentation live? (README, wiki, code comments)
10. How often will this need to be updated?
11. Should this be step-by-step or reference-style?

## General Problem-Solving

### "I'm Not Sure What I Need"

**Exploration:**
1. What problem are you ultimately trying to solve?
2. What's your end goal? (even if you're not sure how to get there)
3. What have you tried so far?
4. What are you considering?

**Constraints:**
5. What do you definitely have or can use? (technologies, time, budget)
6. What are you absolutely not able to use?
7. What's your timeline?

**Learning:**
8. Are there similar systems you've seen that you liked?
9. What do you know you don't want?
10. What would make this a success for you?

### "Something's Not Working But I Don't Know Why"

**Narrowing Down:**
1. What were you trying to do when you noticed the problem?
2. What did you expect to happen?
3. What actually happened?
4. Has this ever worked before? If so, what changed?

**Context:**
5. Can you share the relevant code or configuration?
6. What environment are you in? (browser, OS, dev vs. prod)
7. Are there any error messages or console output?
8. Can you reproduce this consistently?

**Troubleshooting:**
9. What have you already tried to fix it?
10. Does this happen everywhere or just in one place?
11. When did this start happening?

## Quick Question Templates

### For Any Task
- What problem are you solving?
- Who will use this?
- What should the experience be like?
- What are the constraints?
- What does success look like?
- Are there examples to follow?

### For Technical Decisions
- What options are you considering?
- What's most important to you? (speed, cost, quality, maintainability)
- What can't be changed?
- What's your risk tolerance?

### For Ambiguity
- Can you give me an example?
- What did you have in mind?
- Can you show me something similar?
- What would make you happy with the result?

### For Scope
- Is this a quick fix or a comprehensive solution?
- What's the minimum that would be useful?
- What's out of scope?
- Should we tackle this in phases?

## Combining AskUserQuestion with Open-Ended Follow-ups

**Strategy**: Use `AskUserQuestion` for structured choices, then follow up with open-ended questions based on answers.

**Example**:
```
1. AskUserQuestion: Get technical background, timeframe, scope preferences
2. Based on answers: Ask specific follow-up questions
3. Confirm understanding before proceeding
```

This balances efficiency with depth.
