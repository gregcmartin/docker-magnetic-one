#!/bin/bash
set -e

# Activate virtual environment
source /app/venv/bin/activate

# Install AutoGen only if not already installed
if ! pip list | grep -q "pyautogen"; then
    cd /autogen/python
    uv sync --all-extras
    source .venv/bin/activate
    cd /autogen/python/packages/autogen-magentic-one
    pip -e .
    playwright install --with-deps chromium
fi


# Keep container running
exec tail -f /dev/null
