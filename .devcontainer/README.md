# Dev Container Setup

This workshop uses `mcr.microsoft.com/devcontainers/python:3.14`, configured with Python 3.14 and the latest LangChain ecosystem packages.

## Start

1. Open the repository in VS Code.
2. Choose **Dev Containers: Reopen in Container**.
3. During container creation, `post-create.sh` installs the locked Python environment with `uv sync --frozen`.
4. Copy `example.env` to `.env` if it was not created automatically, then add the required API keys.

After setup completes, run:

```bash
uv run python env_utils.py
uv run jupyter lab --ip=0.0.0.0 --allow-root
```

Port 8888 is forwarded for Jupyter Lab. Ports 8000 and 8001 remain available for LangGraph development and local services.

## Prerequisites

The Dev Container provides Python, Git, GitHub CLI, and VS Code Python/Jupyter extensions. `uv` manages the course environment; the committed `uv.lock` makes dependency installation reproducible.

Module 2 uses `uvx` for its MCP-server exercise. Module 3's Node/pnpm chat UI is not part of this workshop baseline.