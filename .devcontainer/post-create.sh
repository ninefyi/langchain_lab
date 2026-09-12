#!/bin/bash
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
    python -m pip install --user uv
    export PATH="$HOME/.local/bin:$PATH"
fi

uv sync --frozen

if [ ! -f .env ] && [ -f example.env ]; then
    cp example.env .env
    echo "Created .env from example.env. Add the required workshop API keys."
fi

uv run python env_utils.py || echo "Environment verification reported configuration warnings."

echo "Setup complete. Start Jupyter with: uv run jupyter lab --ip=0.0.0.0 --allow-root"
