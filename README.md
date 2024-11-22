# Docker AutoGen

A Docker environment for Microsoft's AutoGen framework.

## Prerequisites

- Docker and Docker Compose
- OpenAI API key or Azure OpenAI access

## Setup

1. Clone and enter the repository:
```bash
git clone git@github.com:gregcmartin/docker-magnetic-one.git
cd docker-magnetic-one
```

2. Set up environment:
```bash
cp .env.example .env
```

3. Configure `.env`:
   - Set `CHAT_COMPLETION_PROVIDER` ('azure' or 'openai')
   - Add your API credentials in `CHAT_COMPLETION_KWARGS_JSON`
   - Optional: Add `BING_API_KEY` for web search

## Usage

Start the container:
```bash
docker-compose up --build
```

This will:
- Set up Docker environment
- Install AutoGen with all extras
- Maintain data in a persistent volume

## Troubleshooting

Check logs:
```bash
docker-compose logs
```

Reset installation:
```bash
docker-compose down -v
docker-compose up --build
```

## License

Licensed under the terms of the Microsoft AutoGen repository license.
