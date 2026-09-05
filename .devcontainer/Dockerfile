# Use official Python runtime as base image
FROM python:3.14-bookworm

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    UV_COMPILE_BYTECODE=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    pkg-config \
    portaudio19-dev \
    libsndfile1-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install uv (recommended package manager)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"

# Install pip (as fallback)
RUN python -m pip install --upgrade pip setuptools wheel

# Set working directory
WORKDIR /workspaces

# Create a non-root user for development (optional but recommended)
RUN useradd -m -s /bin/bash devuser

# Copy requirements files if they exist
COPY requirements.txt pyproject.toml uv.lock* ./

# Install dependencies using uv if uv.lock exists, otherwise fall back to pip
RUN if [ -f uv.lock ]; then \
    uv sync --frozen; \
    else \
    pip install -r requirements.txt; \
    fi || true

# Install additional development tools
RUN pip install --upgrade pip && \
    pip install \
    ipython \
    ipdb \
    black \
    isort \
    flake8 \
    pytest \
    pytest-cov

# Make devuser the owner of workspaces
RUN chown -R devuser:devuser /workspaces

# Switch to devuser
USER devuser

# Start bash by default
CMD ["/bin/bash"]
