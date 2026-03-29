<div align="center">

# Shipwright

**Autonomous Product Development Life Cycle for Claude Code**

16 Skills + 138 Agents — research, plan, design, develop, test, deploy, review, and improve autonomously.

![Skills](https://img.shields.io/badge/skills-16-blue?style=flat-square)
![Agents](https://img.shields.io/badge/agents-138-green?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

</div>

> **Note:** The 138 agent definitions in this project are derived from [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents), an open-source collection of Claude Code subagents. Shipwright extends them with 16 PDLC skills and a full autonomous sprint-based development orchestrator.

## What is Shipwright?

Shipwright is an autonomous software development system that runs inside Claude Code. Give it a domain and project type, and it will:

1. **Research** trending projects in your chosen domain
2. **Plan** the product — vision, requirements, sprint backlog with subtask breakdowns
3. **Design** the architecture — tech stack, system design, API specs
4. **Develop** in realistic 7-day sprints with day-by-day commits from specialized agents
5. **Test** with automated test suites and security audits
6. **Deploy** with CI/CD pipelines and release management
7. **Review** with sprint demos, retrospectives, and 1:1 agent coaching
8. **Improve** — feed learnings into the next sprint so agents get better over time

The entire lifecycle is managed by a three-tier hierarchy: a Manager (orchestrator), a Product Manager, and 100+ specialized Software Engineer agents.

---

## Installation

### One-Liner Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/dipandhali2021/shipwright/main/install.sh | bash
```

Or from a cloned repo:
```bash
git clone https://github.com/dipandhali2021/shipwright && cd shipwright && bash install.sh
```

Installs all 16 skills + 138 agents + skills-lock.json to `.claude/`.

### Optional: GitHub Release Skill

For automated GitHub releases with pre-release sanitization (secrets scanning, license/README validation) after each sprint:

```bash
npx skills add https://github.com/jezweb/claude-skills --skill github-release
```

### Manual Installation

1. Clone this repository
2. Copy desired agent files to:
   - `~/.claude/agents/` for global access
   - `.claude/agents/` for project-specific use
3. Customize based on your project requirements

### Interactive Installer
```bash
git clone https://github.com/dipandhali2021/shipwright.git && cd shipwright
./install-agents.sh
```
Interactive TUI to browse and selectively install/uninstall agents.

---

## PDLC Commands

| Command | Description |
|---------|-------------|
| `/pdlc` | Resume from current state |
| `/pdlc research` | Research trending projects (asks for domain + project type) |
| `/pdlc research <domain> <type>` | Research with inline domain and type (e.g., `/pdlc research fintech mobile-app`) |
| `/pdlc plan` | Create product plan + architecture design |
| `/pdlc sprint` | Run one full sprint cycle (develop + test + deploy + review + improve) |
| `/pdlc deploy` | Deploy current sprint |
| `/pdlc review` | Run review + improvement phase |
| `/pdlc full-cycle` | End-to-end: research through all sprints to completion |
| `/pdlc dashboard` | Show project dashboard with metrics |
| `/pdlc status` | Show current project state |
| `/pdlc roadmap` | Create or update the product roadmap |

Natural language also works:
- "what should I build" / "find trending projects" triggers **research**
- "start a new project" / "build something" triggers **full-cycle**
- "next sprint" / "continue building" triggers **sprint**
- "how's the project going" triggers **status**

---

## How It Works

### Phase 1: Research

Before scanning, Shipwright asks you two questions:

1. **Domain** — What area to research (developer tools, fintech, health tech, AI/ML, education, gaming, e-commerce, IoT, security, etc.)
2. **Project Type** — What kind of project to build (web full-stack, backend API, frontend SPA, mobile app, CLI tool, desktop app, browser extension, library/SDK, etc.)

Four research agents then scan in waves:
- **Wave 1:** trend-analyst + search-specialist + market-researcher scan the domain
- **Wave 2:** competitive-analyst + data-researcher analyze existing solutions
- **Wave 3:** research-analyst scores candidates (0-100) and recommends the top pick

Each research artifact is committed individually with realistic 1-2 hour gaps between commits using `research:` prefix.

### Phase 2: Planning & Design

- Product vision, requirements, and sprint plan created
- Stories decomposed into **8-12 subtasks** each — every subtask maps to one commit
- Architecture decisions documented as ADRs
- Tech stack selected based on project type and agent capabilities
- **Google Stitch MCP** generates UI/UX designs (if configured)

### Phase 3: Sprint Execution (7-Day Cycle)

Each sprint follows a realistic 7-day schedule:

```
Monday:    Sprint Planning — stories assigned, subtasks created
Tuesday:   Day 1 — standup, subtask sessions, staggered commits
Wednesday: Day 2 — standup, continue subtasks
Thursday:  Day 3 — standup, core work progressing
Friday:    Day 4 — standup, mid-sprint push
Saturday:  Day 5 — standup, stories targeting completion
Sunday:    Integration + Sprint Review + Retrospective
```

#### Session-Based Execution

Development runs as a series of short Claude sessions:

```
┌─────────────────────────────────────────┐
│  Session: Each agent does ONE subtask   │
│  → github-ops-manager commits it        │
│  → staggered timestamp per agent        │
└─────────────────────────────────────────┘
              ↓ 1-2 hour gap
┌─────────────────────────────────────────┐
│  Next session: agents pick next subtask │
└─────────────────────────────────────────┘
```

- **5-12 sessions per day** (randomized, not fixed)
- **Staggered commit times** — each agent commits at a different time using `GIT_AUTHOR_DATE`/`GIT_COMMITTER_DATE`
- **No WIP commits** — every commit is a complete, self-contained subtask
- **Conventional commits** — `feat:`, `fix:`, `test:`, `refactor:`, `chore:` with `Refs #N` issue linking

#### Daily Standups

Standups run at the start of each sprint day, tracking subtask-level progress:

```
Standup — Day 3 (Thursday)

react-specialist:
  Yesterday: 3 subtasks — form validation, login API, error handling
  Today: Signup form, signup API, login tests
  Story S-1-01: 7/10 subtasks done
  Blockers: None

backend-developer:
  Yesterday: 3 subtasks — auth middleware, JWT tokens, password hashing
  Today: Integration tests, error responses, rate limiting
  Story S-1-02: 5/10 subtasks done
  Blockers: Need JWT_SECRET in env
```

### Phase 4: Review & Improvement

Every sprint MUST complete with review and improvement — they are not optional:

- **Sprint Review** — Each agent demos completed work; product-manager evaluates against acceptance criteria; simulated user personas provide feedback
- **Sprint Retrospective** — All agents share what went well / didn't / suggestions; scrum-master synthesizes action items
- **1:1 Coaching** — Orchestrator holds coaching sessions with underperforming agents; coaching notes are prepended to agent context in all future sprints
- **Improvement Backlog** — Retro action items, coaching fixes, tech debt, and error patterns are converted into GitHub issues and queued as stories for the next sprint

### Phase 5: Next Sprint

Improvement stories from the previous sprint are automatically prioritized alongside new feature stories. The product-manager decides what goes into each sprint. The loop continues until all planned sprints complete.

```
RESEARCH → PLANNING → DESIGN → [DEVELOPMENT → TESTING → DEPLOYMENT → REVIEW → IMPROVE] → next sprint → ... → COMPLETE
```

---

## Three-Tier Role Hierarchy

| Tier | Role | Responsibilities |
|------|------|-----------------|
| **Tier 1: Manager** | pdlc-orchestrator | Oversees full lifecycle, delegates to PMs and engineers, conducts coaching. Never writes code. |
| **Tier 2: Product Manager** | product-manager | Owns the backlog, prioritizes features, evaluates deliverables. Does not make architecture decisions. |
| **Tier 3: Engineers** | 100+ specialized agents | Execute assigned stories using domain expertise. Do not self-assign work. |

---

## Execution Modes

### Subagent Mode (Default)

The orchestrator spawns child agents via Claude Code's Agent tool. Children execute tasks and report back. Works everywhere.

### Agent Teams Mode (Experimental)

Multiple Claude Code instances work as a coordinated team with a shared task list and peer-to-peer messaging. Enables true parallel execution.

```bash
# Enable Agent Teams
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=true
```

| Phase | Agent Teams? | Why |
|-------|-------------|-----|
| RESEARCH | Yes | 3+ agents self-coordinate wave-based scanning |
| PLANNING | No | Sequential pipeline, orchestrator control needed |
| DESIGN | No | Hub-spoke pattern, Stitch MCP is orchestrator-driven |
| DEVELOPMENT | **Yes (primary)** | 4 concurrent devs self-assign stories, peer-coordinate |
| TESTING | Yes | Independent test streams, real-time peer critique |
| DEPLOYMENT | No | Safety-critical, needs orchestrator gating |
| REVIEW | Yes | Concurrent demos, peer retro reflections |
| IMPROVE | No | Orchestrator-driven coaching, inherently hierarchical |

Falls back to subagent mode automatically when Agent Teams is not available.

---

## Integrations

### Google Stitch MCP

AI-powered design-to-code for projects with a frontend component:
- `enhance-prompt` — refine vague UI ideas into detailed design specs
- `stitch-design` — generate high-fidelity screen designs
- `react-components` — convert designs to validated React components
- `stitch-loop` — generate complete multi-page app structure

```bash
claude mcp add stitch --transport http https://stitch.googleapis.com/mcp --header "X-Goog-Api-Key: YOUR_KEY" -s user
```

### GitHub Operations

The `github-ops-manager` agent coordinates all GitHub workflows:
- **Commits** — Conventional commits with staggered timestamps per agent
- **Issues** — One issue per user story, updated with subtask progress
- **PRs** — Sprint PR with all stories, linked issues, reviewed by code-reviewer and architect-reviewer
- **Releases** — Tagged GitHub release after each sprint using `github-release` skill (with pre-release sanitization: secrets scan, license check, README validation) or `gh release create` fallback
- **Gists** — Share sprint artifacts externally

### External Skills

| Category | Skills |
|----------|--------|
| Sprint Ceremonies | sprint-planning, scrum-master, task-estimation, standup-meeting, sprint-retrospective |
| Roadmap | roadmap-update |
| GitHub | git-commit, github-issues, gh-cli, pr-create, prd, excalidraw-diagram-generator |
| Release | github-release (sanitize + publish tagged releases) |
| Video | remotion-best-practices |

---

## PDLC Artifacts

All PDLC state is stored in `.pdlc/` in the project directory:

```
.pdlc/
├── config.json              # Project state, phase, sprint progress, session tracking
├── dashboard.md             # Project dashboard with metrics
├── research/                # Research artifacts (trend scans, market analysis, project selection)
├── architecture/            # System design, API spec, ADRs, roadmap
│   └── adr/
├── sprints/
│   └── sprint-N/
│       ├── plan.md          # Sprint plan with subtask breakdowns
│       ├── results.md       # Sprint results and metrics
│       ├── meetings/        # Planning, standups, review, retro transcripts
│       ├── agent-log.md     # All agent invocations and decisions
│       └── improvement-backlog.md  # Improvement items for next sprint
└── retrospective/
    ├── coaching/            # Per-agent coaching profiles (cumulative)
    ├── self-improvement-log.md
    ├── recommendations.md
    └── tech-debt.md
```

---

## Agents

The 138 agents are organized into 10 categories. All agents are derived from [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents).

### [01. Core Development](agents/)
Essential development subagents for everyday coding tasks.

- [**api-designer**](agents/api-designer.md) - REST and GraphQL API architect
- [**backend-developer**](agents/backend-developer.md) - Server-side expert for scalable APIs
- [**electron-pro**](agents/electron-pro.md) - Desktop application expert
- [**frontend-developer**](agents/frontend-developer.md) - UI/UX specialist for React, Vue, and Angular
- [**fullstack-developer**](agents/fullstack-developer.md) - End-to-end feature development
- [**graphql-architect**](agents/graphql-architect.md) - GraphQL schema and federation expert
- [**microservices-architect**](agents/microservices-architect.md) - Distributed systems designer
- [**mobile-developer**](agents/mobile-developer.md) - Cross-platform mobile specialist
- [**ui-designer**](agents/ui-designer.md) - Visual design and interaction specialist
- [**websocket-engineer**](agents/websocket-engineer.md) - Real-time communication specialist

### [02. Language Specialists](agents/)
Language-specific experts with deep framework knowledge.
- [**typescript-pro**](agents/typescript-pro.md) - TypeScript specialist
- [**sql-pro**](agents/sql-pro.md) - Database query expert
- [**swift-expert**](agents/swift-expert.md) - iOS and macOS specialist
- [**vue-expert**](agents/vue-expert.md) - Vue 3 Composition API expert
- [**angular-architect**](agents/angular-architect.md) - Angular 15+ enterprise patterns expert
- [**cpp-pro**](agents/cpp-pro.md) - C++ performance expert
- [**csharp-developer**](agents/csharp-developer.md) - .NET ecosystem specialist
- [**django-developer**](agents/django-developer.md) - Django 4+ web development expert
- [**dotnet-core-expert**](agents/dotnet-core-expert.md) - .NET 8 cross-platform specialist
- [**dotnet-framework-4.8-expert**](agents/dotnet-framework-4.8-expert.md) - .NET Framework legacy enterprise specialist
- [**elixir-expert**](agents/elixir-expert.md) - Elixir and OTP fault-tolerant systems expert
- [**expo-react-native-expert**](agents/expo-react-native-expert.md) - Expo and React Native mobile development expert
- [**fastapi-developer**](agents/fastapi-developer.md) - Modern async Python API framework expert
- [**flutter-expert**](agents/flutter-expert.md) - Flutter 3+ cross-platform mobile expert
- [**golang-pro**](agents/golang-pro.md) - Go concurrency specialist
- [**java-architect**](agents/java-architect.md) - Enterprise Java expert
- [**javascript-pro**](agents/javascript-pro.md) - JavaScript development expert
- [**powershell-5.1-expert**](agents/powershell-5.1-expert.md) - Windows PowerShell 5.1 and full .NET Framework automation specialist
- [**powershell-7-expert**](agents/powershell-7-expert.md) - Cross-platform PowerShell 7+ automation and modern .NET specialist
- [**kotlin-specialist**](agents/kotlin-specialist.md) - Modern JVM language expert
- [**laravel-specialist**](agents/laravel-specialist.md) - Laravel 10+ PHP framework expert
- [**nextjs-developer**](agents/nextjs-developer.md) - Next.js 14+ full-stack specialist
- [**php-pro**](agents/php-pro.md) - PHP web development expert
- [**python-pro**](agents/python-pro.md) - Python ecosystem master
- [**rails-expert**](agents/rails-expert.md) - Rails 8.1 rapid development expert
- [**react-specialist**](agents/react-specialist.md) - React 18+ modern patterns expert
- [**rust-engineer**](agents/rust-engineer.md) - Systems programming expert
- [**spring-boot-engineer**](agents/spring-boot-engineer.md) - Spring Boot 3+ microservices expert
- [**symfony-specialist**](agents/symfony-specialist.md) - Symfony 6+/7+/8+ PHP framework and Doctrine ORM expert


### [03. Infrastructure](agents/)
DevOps, cloud, and deployment specialists.

- [**azure-infra-engineer**](agents/azure-infra-engineer.md) - Azure infrastructure and Az PowerShell automation expert
- [**cloud-architect**](agents/cloud-architect.md) - AWS/GCP/Azure specialist
- [**database-administrator**](agents/database-administrator.md) - Database management expert
- [**docker-expert**](agents/docker-expert.md) - Docker containerization and optimization expert
- [**deployment-engineer**](agents/deployment-engineer.md) - Deployment automation specialist
- [**devops-engineer**](agents/devops-engineer.md) - CI/CD and automation expert
- [**devops-incident-responder**](agents/devops-incident-responder.md) - DevOps incident management
- [**incident-responder**](agents/incident-responder.md) - System incident response expert
- [**kubernetes-specialist**](agents/kubernetes-specialist.md) - Container orchestration master
- [**network-engineer**](agents/network-engineer.md) - Network infrastructure specialist
- [**platform-engineer**](agents/platform-engineer.md) - Platform architecture expert
- [**security-engineer**](agents/security-engineer.md) - Infrastructure security specialist
- [**sre-engineer**](agents/sre-engineer.md) - Site reliability engineering expert
- [**terraform-engineer**](agents/terraform-engineer.md) - Infrastructure as Code expert
- [**terragrunt-expert**](agents/terragrunt-expert.md) - Terragrunt orchestration and DRY IaC specialist
- [**windows-infra-admin**](agents/windows-infra-admin.md) - Active Directory, DNS, DHCP, and GPO automation specialist

### [04. Quality & Security](agents/)
Testing, security, and code quality experts.

- [**accessibility-tester**](agents/accessibility-tester.md) - A11y compliance expert
- [**ad-security-reviewer**](agents/ad-security-reviewer.md) - Active Directory security and GPO audit specialist
- [**architect-reviewer**](agents/architect-reviewer.md) - Architecture review specialist
- [**chaos-engineer**](agents/chaos-engineer.md) - System resilience testing expert
- [**code-reviewer**](agents/code-reviewer.md) - Code quality guardian
- [**compliance-auditor**](agents/compliance-auditor.md) - Regulatory compliance expert
- [**debugger**](agents/debugger.md) - Advanced debugging specialist
- [**error-detective**](agents/error-detective.md) - Error analysis and resolution expert
- [**penetration-tester**](agents/penetration-tester.md) - Ethical hacking specialist
- [**performance-engineer**](agents/performance-engineer.md) - Performance optimization expert
- [**powershell-security-hardening**](agents/powershell-security-hardening.md) - PowerShell security hardening and compliance specialist
- [**qa-expert**](agents/qa-expert.md) - Test automation specialist
- [**security-auditor**](agents/security-auditor.md) - Security vulnerability expert
- [**test-automator**](agents/test-automator.md) - Test automation framework expert

### [05. Data & AI](agents/)
Data engineering, ML, and AI specialists.

- [**ai-engineer**](agents/ai-engineer.md) - AI system design and deployment expert
- [**data-analyst**](agents/data-analyst.md) - Data insights and visualization specialist
- [**data-engineer**](agents/data-engineer.md) - Data pipeline architect
- [**data-scientist**](agents/data-scientist.md) - Analytics and insights expert
- [**database-optimizer**](agents/database-optimizer.md) - Database performance specialist
- [**llm-architect**](agents/llm-architect.md) - Large language model architect
- [**machine-learning-engineer**](agents/machine-learning-engineer.md) - Machine learning systems expert
- [**ml-engineer**](agents/ml-engineer.md) - Machine learning specialist
- [**mlops-engineer**](agents/mlops-engineer.md) - MLOps and model deployment expert
- [**nlp-engineer**](agents/nlp-engineer.md) - Natural language processing expert
- [**postgres-pro**](agents/postgres-pro.md) - PostgreSQL database expert
- [**prompt-engineer**](agents/prompt-engineer.md) - Prompt optimization specialist
- [**reinforcement-learning-engineer**](agents/reinforcement-learning-engineer.md) - Reinforcement learning and agent training expert

### [06. Developer Experience](agents/)
Tooling and developer productivity experts.

- [**build-engineer**](agents/build-engineer.md) - Build system specialist
- [**cli-developer**](agents/cli-developer.md) - Command-line tool creator
- [**dependency-manager**](agents/dependency-manager.md) - Package and dependency specialist
- [**documentation-engineer**](agents/documentation-engineer.md) - Technical documentation expert
- [**dx-optimizer**](agents/dx-optimizer.md) - Developer experience optimization specialist
- [**git-workflow-manager**](agents/git-workflow-manager.md) - Git workflow and branching expert
- [**legacy-modernizer**](agents/legacy-modernizer.md) - Legacy code modernization specialist
- [**mcp-developer**](agents/mcp-developer.md) - Model Context Protocol specialist
- [**powershell-ui-architect**](agents/powershell-ui-architect.md) - PowerShell UI/UX specialist for WinForms, WPF, Metro frameworks, and TUIs
- [**powershell-module-architect**](agents/powershell-module-architect.md) - PowerShell module and profile architecture specialist
- [**refactoring-specialist**](agents/refactoring-specialist.md) - Code refactoring expert
- [**slack-expert**](agents/slack-expert.md) - Slack platform and @slack/bolt specialist
- [**tooling-engineer**](agents/tooling-engineer.md) - Developer tooling specialist

### [07. Specialized Domains](agents/)
Domain-specific technology experts.

- [**api-documenter**](agents/api-documenter.md) - API documentation specialist
- [**blockchain-developer**](agents/blockchain-developer.md) - Web3 and crypto specialist
- [**embedded-systems**](agents/embedded-systems.md) - Embedded and real-time systems expert
- [**fintech-engineer**](agents/fintech-engineer.md) - Financial technology specialist
- [**game-developer**](agents/game-developer.md) - Game development expert
- [**iot-engineer**](agents/iot-engineer.md) - IoT systems developer
- [**m365-admin**](agents/m365-admin.md) - Microsoft 365, Exchange Online, Teams, and SharePoint administration specialist
- [**mobile-app-developer**](agents/mobile-app-developer.md) - Mobile application specialist
- [**payment-integration**](agents/payment-integration.md) - Payment systems expert
- [**quant-analyst**](agents/quant-analyst.md) - Quantitative analysis specialist
- [**risk-manager**](agents/risk-manager.md) - Risk assessment and management expert
- [**seo-specialist**](agents/seo-specialist.md) - Search engine optimization expert

### [08. Business & Product](agents/)
Product management and business analysis.

- [**business-analyst**](agents/business-analyst.md) - Requirements specialist
- [**content-marketer**](agents/content-marketer.md) - Content marketing specialist
- [**customer-success-manager**](agents/customer-success-manager.md) - Customer success expert
- [**legal-advisor**](agents/legal-advisor.md) - Legal and compliance specialist
- [**product-manager**](agents/product-manager.md) - Product strategy expert
- [**project-manager**](agents/project-manager.md) - Project management specialist
- [**sales-engineer**](agents/sales-engineer.md) - Technical sales expert
- [**scrum-master**](agents/scrum-master.md) - Agile methodology expert
- [**technical-writer**](agents/technical-writer.md) - Technical documentation specialist
- [**ux-researcher**](agents/ux-researcher.md) - User research expert
- [**wordpress-master**](agents/wordpress-master.md) - WordPress development and optimization expert

### [09. Meta & Orchestration](agents/)
Agent coordination and meta-programming.

- [**agent-installer**](agents/agent-installer.md) - Browse and install agents from this repository via GitHub
- [**agent-organizer**](agents/agent-organizer.md) - Multi-agent coordinator
- [**context-manager**](agents/context-manager.md) - Context optimization expert
- [**error-coordinator**](agents/error-coordinator.md) - Error handling and recovery specialist
- [**github-ops-manager**](agents/github-ops-manager.md) - GitHub operations coordinator for commits, PRs, issues, and releases
- [**it-ops-orchestrator**](agents/it-ops-orchestrator.md) - IT operations workflow orchestration specialist
- [**knowledge-synthesizer**](agents/knowledge-synthesizer.md) - Knowledge aggregation expert
- [**multi-agent-coordinator**](agents/multi-agent-coordinator.md) - Advanced multi-agent orchestration
- [**pdlc-orchestrator**](agents/pdlc-orchestrator.md) - Autonomous Product Development Life Cycle master conductor
- [**sprint-ceremony-manager**](agents/sprint-ceremony-manager.md) - Sprint ceremony coordinator for all Scrum ceremonies
- [**performance-monitor**](agents/performance-monitor.md) - Agent performance optimization
- [**pied-piper**](https://github.com/sathish316/pied-piper/) - Orchestrate Team of AI Subagents for repetitive SDLC workflows
- [**task-distributor**](agents/task-distributor.md) - Task allocation specialist
- [**taskade**](https://github.com/taskade/mcp) - AI-powered workspace with autonomous agents, real-time collaboration, and workflow automation with MCP integration
- [**workflow-orchestrator**](agents/workflow-orchestrator.md) - Complex workflow automation

### [10. Research & Analysis](agents/)
Research, search, and analysis specialists.

- [**research-analyst**](agents/research-analyst.md) - Comprehensive research specialist
- [**search-specialist**](agents/search-specialist.md) - Advanced information retrieval expert
- [**trend-analyst**](agents/trend-analyst.md) - Emerging trends and forecasting expert
- [**competitive-analyst**](agents/competitive-analyst.md) - Competitive intelligence specialist
- [**market-researcher**](agents/market-researcher.md) - Market analysis and consumer insights
- [**data-researcher**](agents/data-researcher.md) - Data discovery and analysis expert
- [**scientific-literature-researcher**](agents/scientific-literature-researcher.md) - Scientific paper search and evidence synthesis via [BGPT MCP](https://github.com/connerlambden/bgpt-mcp)

---

## Understanding Subagents

Subagents are specialized AI assistants that enhance Claude Code's capabilities. Each operates in its own context window with domain-specific instructions and granular tool permissions.

### Subagent Structure

```yaml
---
name: subagent-name
description: When this agent should be invoked
tools: Read, Write, Edit, Bash, Glob, Grep
model: sonnet
---

You are a [role description]...

[Agent-specific checklists, patterns, guidelines]
```

### Model Routing

| Model | When Used | Examples |
|-------|-----------|---------|
| `opus` | Deep reasoning — architecture reviews, security audits | `security-auditor`, `architect-reviewer` |
| `sonnet` | Everyday coding — writing, debugging, refactoring | `python-pro`, `backend-developer` |
| `haiku` | Quick tasks — docs, search, dependency checks | `documentation-engineer`, `build-engineer` |

### Tool Permissions by Role

| Role Type | Tools | Purpose |
|-----------|-------|---------|
| Read-only (reviewers) | `Read, Grep, Glob` | Analyze without modifying |
| Research (analysts) | `Read, Grep, Glob, WebFetch, WebSearch` | Gather information |
| Code writers (developers) | `Read, Write, Edit, Bash, Glob, Grep` | Create and execute |
| Documentation | `Read, Write, Edit, Glob, Grep, WebFetch, WebSearch` | Document with research |

### Storage Locations

| Type | Path | Scope |
|------|------|-------|
| Project | `.claude/agents/` | Current project only |
| Global | `~/.claude/agents/` | All projects |

Project subagents take precedence over global ones with the same name.

---

## Tools

### [subagent-catalog](tools/subagent-catalog/)
Claude Code skill for browsing and fetching subagents from this catalog.

| Command | Description |
|---------|-------------|
| `/subagent-catalog:search <query>` | Find agents by name, description, or category |
| `/subagent-catalog:fetch <name>` | Get full agent definition |
| `/subagent-catalog:list` | Browse all categories |
| `/subagent-catalog:invalidate` | Refresh cache |

**Installation:**
```bash
cp -r tools/subagent-catalog ~/.claude/commands/
```

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

- Submit new subagents via PR
- Improve existing definitions
- Report issues and bugs

## Contributors
![Contributors](https://contrib.rocks/image?repo=dipandhali2021/shipwright&max=500&columns=20&anon=1)

## License

MIT License - see [LICENSE](LICENSE)

This repository is a curated collection of subagent definitions contributed by both the maintainers and the community. All subagents are provided "as is" without warranty. We do not audit or guarantee the security or correctness of any subagent. Review before use, the maintainers accept no liability for any issues arising from their use.

If you find an issue, please [open an issue](https://github.com/dipandhali2021/shipwright/issues) and we'll address it promptly.
