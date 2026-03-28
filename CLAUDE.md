# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Shipwright is an autonomous Product Development Life Cycle (PDLC) system for Claude Code. It provides 16 skills + 138 specialized agents that research, plan, design, develop, test, deploy, review, and self-improve across iterative sprint cycles.

## Repository Structure

```
agents/                    # 138 agent .md files (flat directory, canonical source)
skills/                    # 16 PDLC skills for distribution
  pdlc/                    # Master orchestrator skill
    SKILL.md               # Skill entry point (sub-commands, detection, spawn logic)
    agents/                # 3 bundled core agents (copies from agents/)
      pdlc-orchestrator.md # Master conductor — delegates to all other agents
      sprint-ceremony-manager.md  # Scrum ceremony coordinator
      github-ops-manager.md       # GitHub operations coordinator
    references/            # Orchestrator reference files
      agent-registry.md    # 138-agent phase mapping + Agent Teams composition
      phase-definitions.md # 8 phase entry/exit criteria + Agent Teams variants
      templates.md         # All PDLC artifact templates (config.json, sprint plans, etc.)
  sprint-planning/         # Sprint ceremony skills
  scrum-master/
  task-estimation/
  standup-meeting/
  sprint-retrospective/
  roadmap-update/
  pr-create/
  ...
install.sh                 # One-liner installer (skills + agents + lock file)
install-agents.sh          # Interactive TUI agent installer
skills-lock.json           # Tracks installed skills with SHA256 hashes
```

## PDLC Architecture

### Three-Tier Role Hierarchy
- **Tier 1 Manager** (pdlc-orchestrator) — oversees full lifecycle, delegates, coaches
- **Tier 2 Product Manager** (product-manager agent) — owns backlog, prioritizes
- **Tier 3 Engineers** (100+ specialized agents) — execute assigned stories

### Phase State Machine
```
INIT → RESEARCH → PLANNING → DESIGN → DEVELOPMENT ⇄ TESTING → DEPLOYMENT → REVIEW → IMPROVE → (next sprint)
```

### Execution Modes (Dual-Mode)
- **Subagent mode** (default): Orchestrator spawns child agents via Agent tool, children report back
- **Agent Teams mode** (experimental): Multiple Claude instances as Teammates with shared task list and peer messaging. Requires `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=true`. Used for RESEARCH, DEVELOPMENT, TESTING, REVIEW phases. Falls back to subagent mode when unavailable.

### Key Integrations
- **Google Stitch MCP**: AI-powered design-to-code for DESIGN and DEVELOPMENT phases
- **External Skills**: Sprint ceremonies, GitHub operations, roadmap updates
- **Agent Teams**: Claude Code experimental feature for true parallel execution

## Subagent File Format

Each subagent follows this template:

```yaml
---
name: agent-name
description: When this agent should be invoked (used by Claude Code for auto-selection)
tools: Read, Write, Edit, Bash, Glob, Grep  # Comma-separated tool permissions
---

You are a [role description]...

[Agent-specific checklists, patterns, guidelines]

## Communication Protocol
[Inter-agent communication specs]

## Development Workflow
[Structured implementation phases]
```

### Tool Assignment by Role Type

- **Read-only** (reviewers, auditors): `Read, Grep, Glob`
- **Research** (analysts): `Read, Grep, Glob, WebFetch, WebSearch`
- **Code writers** (developers): `Read, Write, Edit, Bash, Glob, Grep`
- **Documentation**: `Read, Write, Edit, Glob, Grep, WebFetch, WebSearch`

## Contributing a New Subagent

When adding a new agent:

1. **Agent .md file** — Create the agent definition in `agents/`
2. **Main README.md** — Add link in appropriate category section (alphabetical order)
3. **Agent registry** — Add to `skills/pdlc/references/agent-registry.md` under the correct phase with spawn conditions
4. **This file** — Update CLAUDE.md if the change affects repo structure, architecture, or workflows

Format for main README: `- [**agent-name**](agents/agent-name.md) - Brief description`

## Bundled Agent Sync

The 3 core agents exist in two places:
- **Canonical source**: `agents/pdlc-orchestrator.md`, `agents/sprint-ceremony-manager.md`, `agents/github-ops-manager.md`
- **Bundled copy**: `skills/pdlc/agents/` (for standalone skill distribution)

When editing these agents, update the canonical source first, then copy to `skills/pdlc/agents/`. Both copies must stay in sync.

## Subagent Storage in Claude Code

| Type | Path | Scope |
|------|------|-------|
| Project | `.claude/agents/` | Current project only |
| Global | `~/.claude/agents/` | All projects |

Project subagents take precedence over global ones with the same name.

## Maintenance Rule

**Always keep this CLAUDE.md up to date.** After any change that affects repository structure, architecture, workflows, or key integration points, update this file to reflect the current state. This ensures Claude Code always has accurate context about the project.
