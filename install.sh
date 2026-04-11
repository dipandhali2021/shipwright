#!/bin/bash
# Shipwright — 16 Skills + 138 Agents in one command
#
# Supports: Claude Code, OpenAI Codex CLI, or both
#
# One-liner:
#   curl -fsSL https://raw.githubusercontent.com/dipandhali2021/shipwright/main/install.sh | bash
#
# Or with a specific CLI:
#   curl -fsSL ... | bash -s -- codex
#   curl -fsSL ... | bash -s -- claude
#
# Or locally:
#   git clone https://github.com/dipandhali2021/shipwright && cd shipwright && bash install.sh

set -e

REPO_URL="https://github.com/dipandhali2021/shipwright.git"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${CYAN}${BOLD}  ███████╗██╗  ██╗██╗██████╗ ██╗    ██╗██████╗ ██╗ ██████╗ ██╗  ██╗████████╗${NC}"
echo -e "${CYAN}${BOLD}  ██╔════╝██║  ██║██║██╔══██╗██║    ██║██╔══██╗██║██╔════╝ ██║  ██║╚══██╔══╝${NC}"
echo -e "${CYAN}${BOLD}  ███████╗███████║██║██████╔╝██║ █╗ ██║██████╔╝██║██║  ███╗███████║   ██║   ${NC}"
echo -e "${CYAN}${BOLD}  ╚════██║██╔══██║██║██╔═══╝ ██║███╗██║██╔══██╗██║██║   ██║██╔══██║   ██║   ${NC}"
echo -e "${CYAN}${BOLD}  ███████║██║  ██║██║██║     ╚███╔███╔╝██║  ██║██║╚██████╔╝██║  ██║   ██║   ${NC}"
echo -e "${CYAN}${BOLD}  ╚══════╝╚═╝  ╚═╝╚═╝╚═╝      ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ${NC}"
echo ""
echo -e "  Autonomous Product Development Life Cycle"
echo -e "  16 Skills + 138 Agents for Claude Code & OpenAI Codex"
echo ""

# ─── Determine target CLI ────────────────────────────────────
INSTALL_CLAUDE=false
INSTALL_CODEX=false

# Check CLI arg
CLI_ARG="${1:-}"

if [ -n "$CLI_ARG" ]; then
    case "$CLI_ARG" in
        claude)   INSTALL_CLAUDE=true ;;
        codex)    INSTALL_CODEX=true ;;
        both)     INSTALL_CLAUDE=true; INSTALL_CODEX=true ;;
        *)
            echo -e "${RED}Unknown option: $CLI_ARG${NC}"
            echo "Usage: bash install.sh [claude|codex|both]"
            echo "  claude  — Install for Claude Code only"
            echo "  codex   — Install for OpenAI Codex CLI only"
            echo "  both    — Install for both (default when no arg)"
            exit 1
            ;;
    esac
else
    # Interactive prompt (skip if non-interactive / piped)
    if [ -t 0 ]; then
        echo -e "${BOLD}  Which CLI do you want to install for?${NC}"
        echo ""
        echo "    1) Claude Code"
        echo "    2) OpenAI Codex CLI"
        echo "    3) Both"
        echo ""
        read -rp "  Enter [1/2/3] (default: 3): " choice
        case "${choice:-3}" in
            1) INSTALL_CLAUDE=true ;;
            2) INSTALL_CODEX=true ;;
            3) INSTALL_CLAUDE=true; INSTALL_CODEX=true ;;
            *) INSTALL_CLAUDE=true; INSTALL_CODEX=true ;;
        esac
    else
        # Piped / non-interactive: install both
        INSTALL_CLAUDE=true
        INSTALL_CODEX=true
    fi
fi

echo ""
if [ "$INSTALL_CLAUDE" = true ]; then
    echo -e "  ${GREEN}✓${NC} Installing for ${BOLD}Claude Code${NC}"
fi
if [ "$INSTALL_CODEX" = true ]; then
    echo -e "  ${GREEN}✓${NC} Installing for ${BOLD}OpenAI Codex CLI${NC}"
fi
echo ""

# ─── Detect source: local repo or remote ─────────────────────
CLEANUP=false
SCRIPT_DIR=""

# Check if BASH_SOURCE exists (not piped from curl)
if [ -n "${BASH_SOURCE[0]:-}" ] && [ "${BASH_SOURCE[0]}" != "bash" ]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
fi

if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/agents" ] && [ -d "$SCRIPT_DIR/skills" ]; then
    SOURCE_DIR="$SCRIPT_DIR"
    echo -e "${GREEN}  Source: local repo${NC}"
else
    # Running via curl | bash — need to clone
    SOURCE_DIR=$(mktemp -d)
    echo -e "${YELLOW}  Cloning repository...${NC}"
    git clone --depth 1 --quiet "$REPO_URL" "$SOURCE_DIR"
    echo -e "${GREEN}  Cloned successfully${NC}"
    CLEANUP=true
fi

echo ""

# ─── Counters ────────────────────────────────────────────────
total_skills=0
total_agents_claude=0
total_agents_codex=0

# ═══════════════════════════════════════════════════════════════
# CLAUDE CODE INSTALLATION
# ═══════════════════════════════════════════════════════════════
if [ "$INSTALL_CLAUDE" = true ]; then
    echo -e "${BLUE}${BOLD}[Claude Code]${NC} Installing skills + agents"
    echo ""

    # Skills → .claude/skills/
    CLAUDE_SKILLS=".claude/skills"
    mkdir -p "$CLAUDE_SKILLS"

    echo -e "  ${CYAN}Skills → ${CLAUDE_SKILLS}/${NC}"
    skill_count=0
    for skill_dir in "$SOURCE_DIR/skills"/*/; do
        skill_name=$(basename "$skill_dir")
        if [ -f "$skill_dir/SKILL.md" ]; then
            cp -r "$skill_dir" "$CLAUDE_SKILLS/$skill_name"
            echo -e "    ${GREEN}+${NC} $skill_name"
            skill_count=$((skill_count + 1))
        fi
    done
    echo -e "  ${GREEN}$skill_count skills installed${NC}"
    total_skills=$skill_count
    echo ""

    # Agents → .claude/agents/
    CLAUDE_AGENTS=".claude/agents"
    mkdir -p "$CLAUDE_AGENTS"

    echo -e "  ${CYAN}Agents → ${CLAUDE_AGENTS}/${NC}"
    agent_count=0
    for agent_file in "$SOURCE_DIR/agents"/*.md; do
        [ -f "$agent_file" ] || continue
        agent_name=$(basename "$agent_file")
        cp "$agent_file" "$CLAUDE_AGENTS/$agent_name"
        agent_count=$((agent_count + 1))
    done
    echo -e "  ${GREEN}$agent_count agents installed${NC}"
    total_agents_claude=$agent_count
    echo ""

    # skills-lock.json
    if [ -f "$SOURCE_DIR/skills-lock.json" ]; then
        cp "$SOURCE_DIR/skills-lock.json" ".claude/skills-lock.json"
        echo -e "  ${GREEN}+${NC} .claude/skills-lock.json"
    fi
    echo ""
fi

# ═══════════════════════════════════════════════════════════════
# CODEX CLI INSTALLATION
# ═══════════════════════════════════════════════════════════════
if [ "$INSTALL_CODEX" = true ]; then
    echo -e "${BLUE}${BOLD}[Codex CLI]${NC} Installing skills + agents"
    echo ""

    # Skills → .agents/skills/ (Codex skill format, same SKILL.md)
    CODEX_SKILLS=".agents/skills"
    mkdir -p "$CODEX_SKILLS"

    echo -e "  ${CYAN}Skills → ${CODEX_SKILLS}/${NC}"
    skill_count=0
    for skill_dir in "$SOURCE_DIR/skills"/*/; do
        skill_name=$(basename "$skill_dir")
        if [ -f "$skill_dir/SKILL.md" ]; then
            cp -r "$skill_dir" "$CODEX_SKILLS/$skill_name"
            echo -e "    ${GREEN}+${NC} $skill_name"
            skill_count=$((skill_count + 1))
        fi
    done
    echo -e "  ${GREEN}$skill_count skills installed${NC}"
    if [ "$INSTALL_CLAUDE" = false ]; then
        total_skills=$skill_count
    fi
    echo ""

    # Agents → .codex/agents/ (TOML format)
    CODEX_AGENTS=".codex/agents"
    mkdir -p "$CODEX_AGENTS"

    # Generate TOML files from markdown agents
    echo -e "  ${CYAN}Agents → ${CODEX_AGENTS}/${NC} (converting to TOML)"
    agent_count=0
    for agent_file in "$SOURCE_DIR/agents"/*.md; do
        [ -f "$agent_file" ] || continue
        agent_name=$(basename "$agent_file" .md)

        # Read the markdown file
        content=$(cat "$agent_file")

        # Extract YAML frontmatter
        name=""
        desc=""
        model=""
        if echo "$content" | head -1 | grep -q '^---'; then
            fm=$(echo "$content" | sed -n '2,/^---$/p' | head -n -1)
            name=$(echo "$fm" | grep '^name:' | head -1 | sed 's/^name:[[:space:]]*//' | tr -d '"' | tr -d "'" | xargs)
            desc=$(echo "$fm" | grep '^description:' | head -1 | sed 's/^description:[[:space:]]*//' | sed 's/^"//;s/"$//' | sed "s/^'//;s/'$//")
            model_val=$(echo "$fm" | grep '^model:' | head -1 | sed 's/^model:[[:space:]]*//' | tr -d '"' | tr -d "'" | xargs)
        fi

        # Default values
        [ -z "$name" ] && name="$agent_name"
        [ -z "$desc" ] && desc="$agent_name agent"

        # Extract body (after second ---)
        body=$(echo "$content" | sed -n '/^---$/,/^---$/!{p}' | tail -n +2 || echo "$content")

        # Escape triple quotes in body
        body_escaped=$(echo "$body" | sed 's/"""/\\"""/g')

        # Write TOML
        cat > "$CODEX_AGENTS/${agent_name}.toml" << TOML_EOF
# ${agent_name}
name = "${name}"
description = """${desc}"""
developer_instructions = """${body_escaped}"""
TOML_EOF

        agent_count=$((agent_count + 1))
    done
    echo -e "  ${GREEN}$agent_count agents installed${NC}"
    total_agents_codex=$agent_count
    echo ""
fi

# ─── Summary ─────────────────────────────────────────────────
echo -e "${BLUE}${BOLD}════════════════════════════════════════${NC}"
echo -e "${GREEN}${BOLD}  Installation complete!${NC}"
echo ""
echo -e "  ${BOLD}Skills${NC}  $total_skills installed"
if [ "$INSTALL_CLAUDE" = true ]; then
    echo -e "  ${BOLD}Claude${NC}  $total_agents_claude agents → .claude/agents/"
    echo -e "  ${BOLD}         ${NC} $total_skills skills → .claude/skills/"
fi
if [ "$INSTALL_CODEX" = true ]; then
    echo -e "  ${BOLD}Codex${NC}   $total_agents_codex agents → .codex/agents/"
    echo -e "  ${BOLD}         ${NC} $total_skills skills → .agents/skills/"
fi
echo ""
echo -e "${BOLD}  Quick Start:${NC}"
echo ""
if [ "$INSTALL_CLAUDE" = true ]; then
    echo "  Claude Code:"
    echo "    /pdlc              Resume from current state"
    echo "    /pdlc full-cycle   Run complete autonomous development"
    echo "    /pdlc research     Research trending projects to build"
    echo "    /pdlc sprint       Execute one development sprint"
    echo ""
fi
if [ "$INSTALL_CODEX" = true ]; then
    echo "  Codex CLI:"
    echo "    codex \"Read .agents/skills/pdlc/SKILL.md and start PDLC\""
    echo "    codex \"Run /pdlc full-cycle\""
    echo ""
fi

# Cleanup temp dir if we cloned
if [ "$CLEANUP" = true ]; then
    rm -rf "$SOURCE_DIR"
fi
