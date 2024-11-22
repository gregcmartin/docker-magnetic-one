FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    docker.io \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv package installer globally
RUN pip install --no-cache-dir uv

# Create non-root user
RUN useradd -u 1000 -m -s /bin/bash appuser

# Set working directory
WORKDIR /app
RUN chown -R appuser:appuser /app

# Make entrypoint script executable
COPY --chown=appuser:appuser entrypoint.sh .
RUN chmod +x /app/entrypoint.sh

# Clone autogen repository with retry logic
RUN mkdir -p /autogen && \
    for i in 1 2 3; do \
        echo "Attempt $i: Cloning AutoGen repository..." && \
        rm -rf /autogen/* && \
        if git clone https://github.com/microsoft/autogen.git /autogen; then \
            echo "Successfully cloned AutoGen repository" && \
            if [ -d "/autogen/.git" ]; then \
                echo "Verified clone was successful" && \
                chown -R appuser:appuser /autogen && \
                break; \
            else \
                echo "Clone verification failed, retrying..." && \
                if [ $i -eq 3 ]; then exit 1; fi; \
            fi; \
        else \
            echo "Clone failed, retrying..." && \
            if [ $i -eq 3 ]; then exit 1; fi; \
        fi; \
        sleep 5; \
    done

# Switch to non-root user
USER appuser

# Create virtual environment
RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
