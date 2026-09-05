# Dev Container Setup for LangChain Foundations

This directory contains the configuration for running the LangChain Foundations course in GitHub Codespaces or Docker.

## Quick Start

### Using GitHub Codespaces
1. Click "Code" → "Codespaces" → "Create codespace on main"
2. Wait for the container to build and dependencies to install
3. Update `.env` with your API keys
4. Start exploring the course materials!

### Using Docker Locally
```bash
# Build the image
docker build -t langchain-foundations .devcontainer

# Run the container
docker run -it -v $(pwd):/workspaces -p 8888:8888 langchain-foundations
```

## Files Included

### `Dockerfile`
- Python 3.14 with all system dependencies
- Supports both `uv` (recommended) and `pip` package managers
- Pre-installs Jupyter Lab, development tools, and all course dependencies

### `devcontainer.json`
- VS Code configuration with recommended extensions:
  - Python, Pylance, Jupyter support
  - Ruff linter, Black formatter
  - Git Lens for version control
  - GitHub Copilot integration
- Port forwarding: 8888 (Jupyter), 8000 (LangGraph API), 8001 (Dev server)
- Automatic dependency installation on container creation

### `post-create.sh`
- Runs after container setup
- Installs Python dependencies using `uv` or `pip`
- Sets up `.env` file from example
- Verifies environment is ready
- Displays setup instructions

## Environment Setup

After the container starts, update your `.env` file with:

```bash
# Required
OPENAI_API_KEY='your-openai-key-here'
TAVILY_API_KEY='your-tavily-key-here'

# Optional (Module 1, Lesson 1 only)
ANTHROPIC_API_KEY='your-anthropic-key-here'
GOOGLE_API_KEY='your-google-key-here'

# Optional (for LangSmith tracing)
LANGSMITH_API_KEY='your-langsmith-key-here'
LANGSMITH_PROJECT=lca-lc-foundation
# LANGSMITH_TRACING=true  # Uncomment to enable
```

## Starting Jupyter Lab

Once the environment is set up, start Jupyter Lab:

```bash
jupyter lab --ip=0.0.0.0 --allow-root
```

Then open the URL shown in your terminal (usually `http://localhost:8888`).

## Installed Tools

- **Python 3.14** - Core runtime
- **uv** - Fast Python package manager (recommended)
- **pip** - Alternative package manager
- **Jupyter Lab** - Interactive notebooks
- **IPython** - Enhanced Python REPL
- **Black, isort, flake8** - Code formatting and linting
- **pytest** - Testing framework
- **All LangChain packages** - LangChain, LangGraph, integrations, etc.

## Resources

- 📚 [Course](https://academy.langchain.com/courses/foundation-introduction-to-langchain-python)
- 📖 [LangChain Docs](https://python.langchain.com)
- 🔗 [LangGraph Docs](https://langchain-ai.github.io/langgraph)
- 🤖 [LangChain Templates](https://github.com/langchain-ai/langchain-templates)

## Troubleshooting

### Dependencies not installing
- Check that `uv` or `pip` is working: `which uv` or `which pip`
- Verify internet connection
- Try running `uv sync --force` or `pip install -r requirements.txt --force-reinstall`

### Jupyter Lab not starting
- Ensure port 8888 is not in use
- Try: `jupyter lab --ip=0.0.0.0 --allow-root --no-browser`
- Check for errors in terminal output

### API key errors
- Verify `.env` file exists and contains correct keys
- Use `python env_utils.py` to validate environment
- Keys should not have quotes in `.env` file

## Features

✅ Python 3.12+ environment
✅ Both `uv` and `pip` support
✅ Jupyter Lab pre-configured
✅ VS Code extensions for Python/Jupyter
✅ Automatic dependency installation
✅ Development tools (linters, formatters)
✅ Port forwarding configured
✅ Git and GitHub CLI included
✅ All LangChain ecosystem packages

## Support

For course-specific questions, visit [LangChain Academy](https://academy.langchain.com).

For dev container issues, check [Dev Containers Documentation](https://containers.dev/).
