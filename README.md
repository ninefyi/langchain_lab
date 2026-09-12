# LangChain Foundations Workshop

Workshop materials adapted from [LangChain Academy's Introduction to LangChain](https://academy.langchain.com/courses/foundation-introduction-to-langchain-python).

This repository imports the upstream course at commit `f032e85ee9060f60050fbc6aa53c089b9553df7f` and currently includes Modules 1, 2, and 3.

## Prerequisites

- Python 3.14 or later
- [uv](https://docs.astral.sh/uv/)
- An OpenAI API key and Tavily API key

The supported development environment is the Python 3.14 Dev Container described in [.devcontainer/README.md](.devcontainer/README.md).

## Setup

```bash
cp example.env .env
# Add OPENAI_API_KEY and TAVILY_API_KEY to .env.
uv sync --frozen
uv run python env_utils.py
uv run jupyter lab
```

`ANTHROPIC_API_KEY`, `GOOGLE_API_KEY`, and LangSmith credentials are optional for the lessons that use them. Do not commit `.env`.

## Workshop Content

- `notebooks/module-1`: foundational models, prompting, tools, memory, multimodal messages, and the Personal Chef project
- `notebooks/module-2`: MCP, context and state, multi-agent systems, and the Wedding Planner project
- `notebooks/module-3`: managing messages, human-in-the-loop workflows, dynamic models/prompts/tools, and the Email Agent project

## Upstream Updates

The `upstream` Git remote tracks `https://github.com/langchain-ai/lca-lc-foundations.git`. Fetch and review only the workshop-owned import surfaces before accepting an update:

```bash
git fetch upstream main
git diff f032e85ee9060f60050fbc6aa53c089b9553df7f..upstream/main -- \
  pyproject.toml uv.lock requirements.txt example.env env_utils.py \
  notebooks/module-1 notebooks/module-2
```

Apply reviewed changes as focused commits, run the setup checks again, and update the recorded upstream commit above. Do not merge upstream history wholesale: this repository owns its Dev Container and workshop documentation.

## Attribution

The imported course materials are provided under the upstream project's MIT License; see [LICENSE](LICENSE).