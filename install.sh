#!/bin/bash
# Wireframer — Claude Code installer
# Usage: curl -fsSL https://raw.githubusercontent.com/artsandiego/wireframer/main/install.sh | bash

set -e

REPO="artsandiego/wireframer"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"

# Colors
GREEN='\033[0;32m'
DIM='\033[2m'
NC='\033[0m'

echo ""
echo " ▗▖ ▗▖▗▄▄▄▖▗▄▄▖ ▗▄▄▄▖▗▄▄▄▖▗▄▄▖  ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▖"
echo " ▐▌ ▐▌  █  ▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▛▚▞▜▌▐▌   ▐▌ ▐▌"
echo " ▐▌ ▐▌  █  ▐▛▀▚▖▐▛▀▀▘▐▛▀▀▘▐▛▀▚▖▐▛▀▜▌▐▌  ▐▌▐▛▀▀▘▐▛▀▚▖"
echo " ▐▙█▟▌▗▄█▄▖▐▌ ▐▌▐▙▄▄▖▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌  ▐▌▐▙▄▄▖▐▌ ▐▌"
echo ""

# Detect project root (look for .claude/ or .git/)
PROJECT_ROOT="."
if [ -d ".git" ] || [ -d ".claude" ]; then
  PROJECT_ROOT="."
else
  echo "  ⚠  No .git or .claude directory found."
  echo "     Installing in current directory."
  echo ""
fi

# Create directories
mkdir -p "$PROJECT_ROOT/.claude/commands"
mkdir -p "$PROJECT_ROOT/.claude/wireframer-refs"

echo -e "  ${DIM}Downloading command...${NC}"
curl -fsSL "$BASE_URL/claude-code/commands/wireframer.md" \
  -o "$PROJECT_ROOT/.claude/commands/wireframer.md"

echo -e "  ${DIM}Downloading component registry...${NC}"
curl -fsSL "$BASE_URL/claude-code/wireframer-refs/components.json" \
  -o "$PROJECT_ROOT/.claude/wireframer-refs/components.json"

echo -e "  ${DIM}Downloading section library...${NC}"
curl -fsSL "$BASE_URL/claude-code/wireframer-refs/section-library.md" \
  -o "$PROJECT_ROOT/.claude/wireframer-refs/section-library.md"

echo ""
echo -e "  ${GREEN}✓${NC}  Wireframer installed successfully."
echo ""
echo "  Files created:"
echo "    .claude/commands/wireframer.md"
echo "    .claude/wireframer-refs/components.json"
echo "    .claude/wireframer-refs/section-library.md"
echo ""
echo "  Usage: Open Claude Code and type /wireframer"
echo ""
