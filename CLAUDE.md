# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a curated collection of Claude Code subagent definitions - specialized AI assistants for specific development tasks. Subagents are markdown files with YAML frontmatter that Claude Code can load and use.

## Repository Structure

```
agents/                    # 138 agent .md files (flat directory)
skills/                    # 16 PDLC skills for distribution
  pdlc/                    # Master orchestrator skill (bundles 3 core agents)
  sprint-planning/         # Sprint ceremony skills
  ...
install.sh                 # One-liner installer (skills + agents + lock file)
install-agents.sh          # Interactive TUI agent installer
skills-lock.json           # Tracks installed skills with SHA256 hashes
```

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

1. **Agent .md file** - Create the agent definition in `agents/`
2. **Main README.md** - Add link in appropriate category section (alphabetical order)

Format for main README: `- [**agent-name**](agents/agent-name.md) - Brief description`

## Subagent Storage in Claude Code

| Type | Path | Scope |
|------|------|-------|
| Project | `.claude/agents/` | Current project only |
| Global | `~/.claude/agents/` | All projects |

Project subagents take precedence over global ones with the same name.
