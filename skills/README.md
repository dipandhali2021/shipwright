# Shipwright Skills

Autonomous Product Development Life Cycle skills for Claude Code. 16 skills that power the PDLC orchestrator — an autonomous system that researches, plans, designs, develops, tests, deploys, reviews, and self-improves across sprint cycles using 138 specialized agents.

## Installation

### Full Install (Skills + 138 Agents) — Recommended

One command installs everything — all 16 skills + all 138 agents:

```bash
# From the cloned repo
git clone https://github.com/dipandhali2021/shipwright && cd shipwright
bash install.sh
```

Or directly via curl:
```bash
curl -fsSL https://raw.githubusercontent.com/dipandhali2021/shipwright/main/install.sh | bash
```

This gives the PDLC orchestrator access to ALL 138 specialized agents (react-specialist, backend-engineer, code-reviewer, security-auditor, etc.) for a complete autonomous development experience.

### Skills Only (16 skills, 3 bundled agents)

```bash
npx skills add https://github.com/dipandhali2021/shipwright
```

This installs skills only. The PDLC will work with the 3 bundled core agents but optional agents (50+) won't be available. The orchestrator degrades gracefully when agents are missing.

### Install individual skills

```bash
npx skills add https://github.com/dipandhali2021/shipwright --skill <skill-name>
```

## Skills (16 total)

### Core Orchestrator

| Skill | Description | Triggers On |
|-------|-------------|-------------|
| **pdlc** | Master orchestrator for autonomous product development | "start pdlc", "run sprint", "build something" |

### Sprint Ceremony Skills (7)

| Skill | Description | Triggers On |
|-------|-------------|-------------|
| **sprint-planning** | Capacity planning, backlog prioritization, dependency mapping | "plan the sprint", "sprint planning" |
| **scrum-master** | Sprint iteration sizing, user story creation, velocity tracking | "create story", "sprint status", "velocity" |
| **task-estimation** | Fibonacci story points, planning poker, risk-adjusted estimation | "estimate this", "story points", "how many points" |
| **standup-meeting** | Daily standup facilitation (3-Question, Walking-the-Board, Async) | "standup", "daily sync", "blockers" |
| **sprint-retrospective** | Retro facilitation (Start-Stop-Continue, Mad-Sad-Glad, 4Ls) | "retrospective", "retro", "what went well" |
| **roadmap-update** | Roadmap creation/update with RICE, MoSCoW, Now/Next/Later | "update roadmap", "reprioritize", "RICE score" |
| **remotion-best-practices** | Sprint demo video creation using Remotion (React video framework) | Remotion video creation |

### GitHub Integration Skills (5)

| Skill | Description | Triggers On |
|-------|-------------|-------------|
| **pr-create** | Structured PR creation with test plans and issue linking | "create pr", "pull request", "open pr" |
| **git-commit** | Conventional commits with smart staging and diff analysis | "commit", "git commit" |
| **github-issues** | Create, update, and manage GitHub issues with MCP + gh CLI | "create issue", "file a bug", "feature request" |
| **gh-cli** | Comprehensive GitHub CLI reference (repos, PRs, actions, releases) | GitHub CLI operations |
| **prd** | PRD generation with discovery, analysis, and technical drafting | "generate PRD", "product requirements" |

### Design & Development Skills (3)

| Skill | Description | Triggers On |
|-------|-------------|-------------|
| **excalidraw-diagram-generator** | Architecture and system diagrams in Excalidraw format | "create diagram", "draw architecture" |
| **skill-creator** | Create, modify, eval, and optimize Claude Code skills | "create a skill", "skill performance" |
| **sub-agent-creator** | Create specialized Claude Code sub-agents with proper frontmatter | "create agent", "new sub-agent" |

## Usage

After installing, use natural language or slash commands:

```
/pdlc                    # Resume from current state
/pdlc full-cycle         # Run complete autonomous development
/pdlc research           # Research trending projects
/pdlc sprint             # Execute one development sprint
/pdlc review             # Sprint review + retrospective
/pdlc roadmap            # Create or update roadmap
/pdlc dashboard          # Show project metrics
```

## Architecture

The PDLC operates with a three-tier role hierarchy:

1. **Manager** (pdlc-orchestrator) — oversees the full lifecycle
2. **Product Manager** (product-manager agent) — owns backlog, prioritizes features
3. **Software Engineers** (100+ specialized agents) — execute assigned stories

Skills provide methodology and structure to the agents during ceremonies. The orchestrator checks skill availability at runtime and falls back to built-in logic when skills are not installed.

Sprint PRs are automatically reviewed by **code-reviewer** and **architect-reviewer** agents before merge.

### Bundled Agents

The PDLC skill bundles 3 core orchestration agents in `pdlc/agents/`:
- `pdlc-orchestrator.md` — master conductor (spawned as subagent, reads instructions inline)
- `sprint-ceremony-manager.md` — Scrum ceremony coordinator
- `github-ops-manager.md` — GitHub operations coordinator

These are self-contained — no additional agent installation needed for the core PDLC flow. The 50+ general-purpose development agents (react-specialist, backend-engineer, etc.) are optional. If not installed, PDLC degrades gracefully with fallback logic.

**Sync note:** Canonical source for these agents is `agents/`. When updating, edit the canonical source first, then copy to `skills/pdlc/agents/`.

## License

MIT
