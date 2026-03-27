#!/bin/bash
# Shipwright — 16 Skills + 138 Agents in one command
#
# One-liner:
#   curl -fsSL https://raw.githubusercontent.com/dipandhali2021/shipwright/main/install.sh | bash
#
# Or locally:
#   git clone https://github.com/dipandhali2021/shipwright && cd claude-code && bash install.sh

set -e

REPO_URL="https://github.com/dipandhali2021/shipwright.git"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
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
echo -e "${BOLD}  Autonomous Product Development Life Cycle${NC}"
echo -e "  16 Skills + 138 Agents for Claude Code"
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

# ─── Step 1: Install Skills ──────────────────────────────────
echo -e "${BLUE}${BOLD}[1/4]${NC} Installing skills to ${BOLD}.claude/skills/${NC}"

SKILLS_DIR=".claude/skills"
mkdir -p "$SKILLS_DIR"

skill_count=0
for skill_dir in "$SOURCE_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    if [ -f "$skill_dir/SKILL.md" ]; then
        cp -r "$skill_dir" "$SKILLS_DIR/$skill_name"
        echo -e "  ${GREEN}+${NC} $skill_name"
        skill_count=$((skill_count + 1))
    fi
done

echo -e "  ${GREEN}$skill_count skills installed${NC}"
echo ""

# ─── Step 2: Install Agents ──────────────────────────────────
echo -e "${BLUE}${BOLD}[2/4]${NC} Installing agents to ${BOLD}.claude/agents/${NC}"

AGENTS_DIR=".claude/agents"
mkdir -p "$AGENTS_DIR"

agent_count=0
for agent_file in "$SOURCE_DIR/agents"/*.md; do
    [ -f "$agent_file" ] || continue
    agent_name=$(basename "$agent_file")
    cp "$agent_file" "$AGENTS_DIR/$agent_name"
    agent_count=$((agent_count + 1))
done

echo -e "  ${GREEN}$agent_count agents installed${NC}"
echo ""

# ─── Step 3: Copy skills-lock.json ───────────────────────────
echo -e "${BLUE}${BOLD}[3/4]${NC} Installing ${BOLD}skills-lock.json${NC}"

if [ -f "$SOURCE_DIR/skills-lock.json" ]; then
    cp "$SOURCE_DIR/skills-lock.json" ".claude/skills-lock.json"
    echo -e "  ${GREEN}+${NC} skills-lock.json"
else
    echo -e "  ${YELLOW}⚠${NC} skills-lock.json not found, skipping"
fi
echo ""

# ─── Step 4: Summary ─────────────────────────────────────────
echo -e "${BLUE}${BOLD}[4/4]${NC} ${GREEN}${BOLD}Installation complete!${NC}"
echo ""
echo -e "  ${BOLD}Skills${NC}      $skill_count installed → .claude/skills/"
echo -e "  ${BOLD}Agents${NC}      $agent_count installed → .claude/agents/"
echo -e "  ${BOLD}Lock file${NC}   .claude/skills-lock.json"
echo ""
echo -e "${BOLD}  Quick Start:${NC}"
echo ""
echo "    /pdlc              Resume from current state"
echo "    /pdlc full-cycle   Run complete autonomous development"
echo "    /pdlc research     Research trending projects to build"
echo "    /pdlc sprint       Execute one development sprint"
echo "    /pdlc review       Sprint review + retrospective"
echo "    /pdlc roadmap      Create or update product roadmap"
echo ""
echo -e "  All $agent_count agents are ready for the PDLC orchestrator."
echo -e "  Run ${BOLD}/pdlc${NC} in Claude Code to get started."
echo ""

# Cleanup temp dir if we cloned
if [ "$CLEANUP" = true ]; then
    rm -rf "$SOURCE_DIR"
fi
