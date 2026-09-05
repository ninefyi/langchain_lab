#!/bin/bash
set -e

echo "🚀 LangChain Foundations - Development Container Setup"
echo "======================================================"
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Install Python dependencies
echo -e "${BLUE}📦 Installing Python dependencies...${NC}"
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    pip install --user uv &> /dev/null || true
fi
if command -v uv &> /dev/null && [ -f pyproject.toml ]; then
    echo "Using uv (recommended)..."
    uv sync
elif [ -f requirements.txt ]; then
    echo "Using pip (fallback)..."
    pip install -r requirements.txt
else
    echo -e "${YELLOW}⚠️  No requirements.txt or pyproject.toml found. Skipping dependency install.${NC}"
fi
echo -e "${GREEN}✓ Dependencies installed${NC}"
echo ""

# Step 2: Setup environment variables
echo -e "${BLUE}🔐 Setting up environment variables...${NC}"
if [ ! -f .env ]; then
    if [ -f example.env ]; then
        cp example.env .env
        echo -e "${YELLOW}⚠️  Created .env from example.env${NC}"
        echo -e "${YELLOW}⚠️  Please update .env with your API keys:${NC}"
        echo "    - OPENAI_API_KEY"
        echo "    - TAVILY_API_KEY"
        echo "    - ANTHROPIC_API_KEY (optional)"
        echo "    - GOOGLE_API_KEY (optional)"
        echo "    - LANGSMITH_API_KEY (optional)"
    else
        echo -e "${YELLOW}⚠️  No .env file found. Create one with your API keys.${NC}"
    fi
else
    echo -e "${GREEN}✓ .env file exists${NC}"
fi
echo ""

# Step 3: Verify installation
echo -e "${BLUE}✓ Verifying Python setup...${NC}"
python --version
echo -e "${GREEN}✓ Python ready${NC}"
echo ""

# Step 4: Optional - Run environment verification script
if [ -f env_utils.py ]; then
    echo -e "${BLUE}📋 Running environment verification...${NC}"
    python env_utils.py || echo -e "${YELLOW}⚠️  Environment verification had warnings (this is OK)${NC}"
    echo ""
fi

# Step 5: Display setup complete message
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo ""
echo "📚 Next steps:"
echo "   1. Update .env with your API keys (OPENAI_API_KEY, TAVILY_API_KEY, etc.)"
echo "   2. Start Jupyter Lab: jupyter lab --ip=0.0.0.0"
echo "   3. Or explore the notebooks in the notebooks/ directory"
echo ""
echo "📖 Documentation:"
echo "   - Course: https://academy.langchain.com/courses/foundation-introduction-to-langchain-python"
echo "   - LangChain Docs: https://python.langchain.com"
echo "   - LangGraph Docs: https://langchain-ai.github.io/langgraph"
echo ""
