#!/bin/bash
set -e

# Activate virtual environment
source /app/venv/bin/activate

# Install AutoGen only if not already installed
if ! pip list | grep -q "pyautogen"; then
    cd /autogen/python
    uv sync --all-extras
fi

# Keep container running
exec tail -f /dev/null
