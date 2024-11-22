#!/bin/bash

# Clone AutoGen repository if it doesn't exist
if [ ! -d "/autogen" ]; then
    git clone https://github.com/microsoft/autogen.git /autogen
fi

# Execute the command passed to docker-compose
exec "$@"
