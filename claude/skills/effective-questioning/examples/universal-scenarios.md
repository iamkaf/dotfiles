# Universal AskUserQuestion Examples

Concrete examples for scenarios beyond software development.

## Skill Creation

**User says:** "I want to create a new skill"

**Round 1 - Understanding Purpose:**
```
AskUserQuestion:
  Q1: What domain or area should this skill cover?
     - Technical/development topic
     - Company-specific knowledge (APIs, processes)
     - Creative work (writing, design)
     - General productivity/workflow
     - Other (please describe)

  Q2: What should this skill help Claude do?
     - Follow specific procedures/workflows
     - Access and use reference materials
     - Execute scripts or utilities
     - Understand specialized knowledge
     - Other (please describe)

  Q3: When should this skill be triggered?
     - User asks specific questions (I'll provide examples)
     - Working in certain file types/directories
     - Certain phrases or keywords
     - Not sure yet - need help figuring this out
```

**Round 2 - Content & Structure:**
```
AskUserQuestion:
  Q1: What resources should the skill include?
     - Scripts/automation (choose this if same code gets rewritten)
     - Reference documentation (APIs, schemas, patterns)
     - Example files/templates
     - Just procedural instructions
     - Multiple of the above

  Q2: Do you have examples of how this skill would be used?
     - Yes, I can provide specific usage examples
     - Yes, but they're vague - need help refining
     - No, you should help me brainstorm scenarios
     - Other (please describe)

  Q3: What's your familiarity with this domain?
     - Expert - don't need basics explained
     - Knowledgeable - but want thorough documentation
     - Learning - want comprehensive guidance
     - Not sure - that's why I'm making this skill
```

## Writing & Content Creation

**User says:** "I need to write an article/blog post"

**Round 1 - Understanding Purpose:**
```
AskUserQuestion:
  Q1: What's the main purpose of this piece?
     - Inform/educate readers
     - Persuade/convince
     - Entertain/inspire
     - Document/record information
     - Other (please describe)

  Q2: Who's the audience?
     - Technical/expert readers
     - General public
     - Industry professionals
     - Students/learners
     - Other (please describe)

  Q3: What's your relationship to the topic?
     - Expert - I know this deeply
     - Knowledgeable - I understand it well
     - Learning - I'm exploring it myself
     - Neutral - researching for this piece
```

**Round 2 - Structure & Style:**
```
AskUserQuestion:
  Q1: What format/style do you prefer?
     - Formal/academic
     - Conversational/casual
     - Technical/detailed
     - Story-driven/narrative
     - Other (please describe or give examples)

  Q2: What should the tone be?
     - Authoritative/expert
     - Approachable/friendly
     - Provocative/opinionated
     - Balanced/objective
     - Other (please describe)

  Q3: Do you have examples of similar writing you like?
     - Yes, I'll share links or references
     - Yes, I can describe the style
     - No, you guide me on what works
     - I want to try something unique
```

## Knowledge Management (Obsidian/Notes)

**User says:** "Help me organize my Obsidian vault"

**Round 1 - Understanding Current State:**
```
AskUserQuestion:
  Q1: What's your main challenge with your vault?
     - Can't find information when I need it
     - Notes are disconnected/hard to navigate
     - Too many duplicate or messy notes
     - Don't know how to structure things
     - Other (please describe)

  Q2: What do you use your vault for?
     - Personal knowledge management (PKM)
     - Work/project documentation
     - Research/academic work
     - Creative writing/ideation
     - Multiple of the above
     - Other (please describe)

  Q3: How many notes are we talking about?
     - Just getting started (0-50 notes)
     - Established (50-500 notes)
     - Large vault (500+ notes)
     - Overwhelming (1000+ notes)
```

**Round 2 - Organizational Preferences:**
```
AskUserQuestion:
  Q1: How do you prefer to organize information?
     - Hierarchical (folders and structure)
     - Networked (links and connections)
     - Tag-based (labels and categories)
     - Chronological (daily notes, journaling)
     - Other (please describe)

  Q2: What's your linking style?
     - Link everything heavily
     - Link only key connections
     - Not sure - need guidance
     - Don't like many links

  Q3: Should I help you with:
     - Restructuring existing notes
     - Setting up templates/workflows
     - Creating taxonomies/tagging systems
     - All of the above
     - Something else
```

## Research & Investigation

**User says:** "I need to research [topic]"

**Round 1 - Understanding Research Goals:**
```
AskUserQuestion:
  Q1: What's your research goal?
     - Write a paper/article
     - Make a decision
     - Learn something new
     - Solve a specific problem
     - Other (please describe)

  Q2: What's your starting point?
     - Complete beginner - know nothing
     - Curious - have basic awareness
     - Familiar - want to go deeper
     - Expert - need cutting-edge info
     - Other (please describe)

  Q3: What depth do you need?
     - Quick overview/summary
     - Thorough understanding
     - Expert-level detail
     - Academic/technical depth
     - Other (please specify)
```

**Round 2 - Research Approach:**
```
AskUserQuestion:
  Q1: What sources do you prefer?
     - Academic/papers
     - Books/long-form
     - Blog posts/articles
     - Videos/tutorials
     - Primary sources/data
     - All credible sources
     - Other (please specify)

  Q2: How should I organize findings?
     - Summary with key points
     - Chronological overview
     - Thematic/categorical
     - Pros/cons comparison
     - Other (please describe)

  Q3: Any specific aspects to focus on?
     - Yes, I have specific questions
     - No, give me comprehensive overview
     - Focus on recent developments
     - Focus on fundamentals/basics
```

## Planning & Projects

**User says:** "Help me plan [project/goal]"

**Round 1 - Understanding Scope:**
```
AskUserQuestion:
  Q1: What kind of project is this?
     - Software/technical project
     - Creative/artistic project
     - Business/entrepreneurial venture
     - Personal goal/habit
     - Event/trip
     - Other (please describe)

  Q2: What's your timeline?
     - Urgent (days/weeks)
     - Short-term (1-3 months)
     - Medium-term (3-6 months)
     - Long-term (6+ months)
     - No hard deadline
     - Other (please specify)

  Q3: What's your commitment level?
     - Full-time focus
     - Part-time/side project
     - Casual/when I can
     - Not sure - need help determining realistic scope
```

**Round 2 - Constraints & Resources:**
```
AskUserQuestion:
  Q1: What resources do you have?
     - Budget/funding available
     - Limited budget, bootstrapping
     - Team/collaborators
     - Solo project
     - Specific tools/technologies required
     - Other (please describe)

  Q2: What's your risk tolerance?
     - Conservative - stick to proven approaches
     - Balanced - willing to try new things
     - Aggressive - want to experiment/innovate
     - Not sure - need guidance on trade-offs

  Q3: What does success look like?
     - Specific outcome measurable
     - Learning/experience focused
     - Building something tangible
     - Completing by deadline
     - Other (please describe)
```

## Learning New Topics

**User says:** "I want to learn [topic]"

**Round 1 - Assessing Starting Point:**
```
AskUserQuestion:
  Q1: What's your current level with this topic?
     - Complete beginner
     - Dabbled/casual familiarity
     - Know basics, want to go deeper
     - Proficient, want mastery
     - Other (please describe)

  Q2: Why do you want to learn this?
     - For work/career
     - Personal project/idea
     - General curiosity
     - Specific problem to solve
     - Other (please describe)

  Q3: How do you prefer to learn?
     - Hands-on/building things
     - Reading/books/docs
     - Video tutorials
     - Practice/exercises
     - Discussion/mentoring
     - Other (please describe)
```

**Round 2 - Learning Strategy:**
```
AskUserQuestion:
  Q1: What's your learning timeline?
     - Need to learn quickly (days/weeks)
     - Steady progress over months
     - No rush, ongoing learning
     - Other (please specify)

  Q2: What depth are you aiming for?
     - Just enough to use it
     - Solid working knowledge
     - Deep understanding
     - Expert level
     - Other (please describe)

  Q3: How should I structure your learning?
     - Start with fundamentals
     - Learn by building project
     - Address specific questions
     - Comprehensive curriculum
     - Other (please specify)
```

## Decision Making

**User says:** "Help me decide between options"

**Round 1 - Understanding Decision:**
```
AskUserQuestion:
  Q1: What kind of decision is this?
     - Technical choice (tools, technologies)
     - Career/life decision
     - Purchase/investment
     - Strategic/business decision
     - Other (please describe)

  Q2: What options are you considering?
     - I have 2-3 specific options
     - I have many options, need to narrow down
     - Open to suggestions
     - Other (please describe)

  Q3: What's most important to you in this decision?
     - Cost/budget
     - Quality/performance
     - Time/effort required
     - Long-term value
     - Risk/uncertainty
     - Other (please describe)
```

**Round 2 - Decision Framework:**
```
AskUserQuestion:
  Q1: What's your decision timeline?
     - Need to decide now
     - Have time to research
     - Ongoing decision, can iterate
     - Other (please specify)

  Q2: How should I help you decide?
     - Compare options side-by-side
     - Identify pros/cons of each
     - Research options I'm unaware of
     - Help clarify priorities
     - All of the above
     - Other (please describe)

  Q3: What would make you confident in this decision?
     - Data/evidence backing it
     - Expert opinion/consensus
     - Personal intuition/gut feeling
     - Testing/experimenting first
     - Other (please describe)
```

## Creative Work (Design/Brainstorming)

**User says:** "Help me brainstorm/creative work"

**Round 1 - Understanding Creative Goal:**
```
AskUserQuestion:
  Q1: What are you creating?
     - Visual design (UI, graphics, art)
     - Writing/creative content
     - Product/service concept
     - Event/experience
     - Other (please describe)

  Q2: What stage are you at?
     - Just starting - blank canvas
     - Have initial ideas/concepts
     - Have rough draft/mockup
     - Refining existing work
     - Other (please describe)

  Q3: What's your creative constraint?
     - Need to stay within brand guidelines
     - Budget/resource limited
     - Time sensitive
     - Technical limitations
     - Open/ unconstrained
     - Other (please describe)
```

**Round 2 - Creative Direction:**
```
AskUserQuestion:
  Q1: What's your inspiration/reference point?
     - I have examples I like
     - I know the aesthetic/vibe
     - Looking for suggestions
     - Want something unique/different
     - Other (please describe)

  Q2: How should we collaborate?
     - You lead, I provide feedback
     - We brainstorm together
     - You give me options to choose from
     - I tell you what I want, you execute
     - Other (please describe)

  Q3: What does success look like?
     - Meets specific requirements
     - Feels "right" intuitively
     - Gets positive feedback from others
     - Achieves specific goal
     - Other (please describe)
```

## Troubleshooting (General Problems)

**User says:** "Something's not working but I don't know why"

**Round 1 - Diagnosis:**
```
AskUserQuestion:
  Q1: What category of problem?
     - Technology/software
     - Process/workflow
     - Communication/people
     - Physical/mechanical
     - Other (please describe)

  Q2: What were you trying to do?
     - Complete a specific task
     - Achieve a particular outcome
     - Fix something that broke
     - Set something up new
     - Other (please describe)

  Q3: What happened instead?
     - Nothing happened
     - Error happened (I have the message)
     - Wrong outcome
     - Partial success
     - Other (please describe)
```

**Round 2 - Investigation:**
```
AskUserQuestion:
  Q1: Has this worked before?
     - Yes, just broke recently
     - Never worked from the start
     - Intermittent/flaky
     - Not sure
     - Other (please explain)

  Q2: What have you tried already?
     - Nothing yet, seeking help first
     - Tried basic troubleshooting
     - Tried several solutions
     - Extensive troubleshooting already
     - Other (please describe)

  Q3: What context might help?
     - I can share error messages/logs
     - I can show you screenshots
     - I can walk you through reproduction
     - Not sure what's relevant
     - Other (please describe)
```

## Quick Question Templates (Universal)

### For ANY Unknown Task
```
AskUserQuestion:
  Q1: What type of task is this?
     - Creative/ideation
     - Analytical/research
     - Organizational/planning
     - Technical/implementation
     - Other (you'll describe)

  Q2: What's your goal?
     - Complete specific outcome
     - Learn/understand something
     - Make a decision
     - Solve a problem
     - Other (please describe)

  Q3: What's your context?
     - Just starting, need guidance
     - Have some background, need specifics
     - Experienced, need refinement
     - Other (please describe)
```

### When User Says "Help Me"
```
AskUserQuestion:
  Q1: What do you need help with?
     - Figuring out what to do (unclear goal)
     - Knowing how to do it (unclear process)
     - Doing it efficiently (need optimization)
     - Doing it better (need improvement)
     - Other (please describe)

  Q2: What's your timeframe?
     - Urgent/immediate
     - Soon/this week
     - Flexible/no deadline
     - Other (please specify)

  Q3: What's your expertise level?
     - Beginner in this area
     - Some experience
     - Knowledgeable
     - Expert
     - Other (please describe)
```

### For Exploration/Discovery
```
AskUserQuestion:
  Q1: What are you exploring?
     - New idea/possibility
     - Problem space
     - Solution options
     - Learning topic
     - Other (please describe)

  Q2: What's your exploration style?
     - Comprehensive/exhaustive
     - Targeted/focused
     - Serendipitous/curiosity-driven
     - Need guidance on approach
     - Other (please describe)

  Q3: What output helps you most?
     - Summary/overview
     - Detailed analysis
     - Options/alternatives
     - Recommendations
     - Other (please specify)
```

## Key Patterns Across All Scenarios

### Pattern 1: Understand → Context → Constraints → Confirm
1. Round 1: What is this? What's the goal?
2. Round 2: What's the context? What are the constraints?
3. Round 3: What are preferences? What style?
4. Round 4: Confirmation and next steps

### Pattern 2: Assessment → Strategy → Execution
1. Round 1: Assess current state/knowledge level
2. Round 2: Understand preferences and approach
3. Round 3: Define scope and specific actions

### Pattern 3: Problem → Diagnosis → Solution
1. Round 1: What's wrong? What's the context?
2. Round 2: What's been tried? What are constraints?
3. Round 3: What should we do? How to verify?

## Universal Best Practices

1. **Always use AskUserQuestion** - never ask in plain text if you could use the tool
2. **3-4 questions per round** - enough to gather info, not overwhelm
3. **Include "Other" option** - capture unanticipated scenarios
4. **Build on answers** - reference previous responses to show understanding
5. **Multiple rounds** - one round is rarely enough for complex tasks
6. **Confirm before acting** - summarize understanding and get approval
