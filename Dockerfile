# Start from a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.11-bookworm-slim

# UV optimizations for production
ENV UV_COMPILE_BYTECODE=1
ENV UV_NO_CACHE=1

# Add uv's bin directory to the PATH
ENV PATH="$PATH:/root/.local/bin:/usr/app/src/.venv/bin"

# Copy the flow directory into the docker container.
COPY [".", "/usr/app/src"]

WORKDIR /usr/app/src

RUN uv sync --frozen --no-dev
