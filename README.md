# Docker AutoGen Environment

A Docker-based environment for Microsoft's AutoGen framework. This project provides a containerized setup for running AutoGen with persistent storage.

## Prerequisites

- Docker and Docker Compose
- OpenAI API key or Azure OpenAI access

## Setup

1. Clone this repository:
```bash
git clone git@github.com:gregcmartin/docker-magnetic-one.git
cd docker-magnetic-one
```

2. Create your environment file:
```bash
cp .env.example .env
```

3. Edit the `.env` file with your configuration:
   - Set `CHAT_COMPLETION_PROVIDER` to either 'azure' or 'openai'
   - Configure `CHAT_COMPLETION_KWARGS_JSON` with your API credentials
   - Optionally set `BING_API_KEY` if you want to use web search functionality

## Running the Container

Build and start the container:
```bash
docker-compose up --build
```

This will:
- Build the container with necessary system dependencies
- Clone the Microsoft AutoGen repository
- Install AutoGen with all extras (only if not already installed)
- Maintain a persistent volume for AutoGen data

## Project Structure

```
.
├── docker-compose.yml       # Docker Compose configuration
├── Dockerfile              # Container definition
├── entrypoint.sh          # Container entrypoint script
└── .env.example           # Environment template
```

## How it Works

The container uses a streamlined approach:

1. During build:
   - Sets up system dependencies
   - Clones the Microsoft AutoGen repository
   - Creates Python virtual environment

2. At runtime:
   - Checks if AutoGen is already installed
   - Installs AutoGen with all extras if needed
   - Maintains persistent data through Docker volume

## Troubleshooting

If you encounter issues:

1. Check the Docker logs:
```bash
docker-compose logs magnetic-one
```

2. Verify your environment variables are correctly set in `.env`

3. If the AutoGen repository fails to clone:
```bash
# Remove the volume and try again
docker-compose down -v
docker-compose up --build
```

## License

This project is licensed under the terms of the Microsoft AutoGen repository license.
