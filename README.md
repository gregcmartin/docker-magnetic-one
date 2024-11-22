# Docker Magnetic-One Web Interface

A Docker-based web interface for Microsoft's Magnetic-One multi-agent system. This project provides a simple web UI to interact with Magnetic-One while keeping the core dependencies isolated in Docker containers.

## Features

- FastAPI backend that integrates with Magnetic-One
- Clean web interface using Tailwind CSS
- Automatic setup of Magnetic-One dependencies through Docker
- Environment-based configuration
- Isolated runtime environment

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

## Running the Application

1. Build and start the containers:
```bash
docker-compose up --build
```

This will:
- Build the application container
- Clone the Microsoft AutoGen repository
- Install all necessary dependencies
- Start the web interface

2. Access the web interface at: http://localhost:8000

## Usage

1. Open your web browser and navigate to http://localhost:8000
2. Enter your task in the text area
3. Click "Execute Task" to run the task using Magnetic-One
4. View the results or any error messages below the form

## Project Structure

```
.
├── app/
│   ├── main.py              # FastAPI application
│   └── templates/
│       └── index.html       # Web interface template
├── docker-compose.yml       # Docker Compose configuration
├── Dockerfile              # Container definition
├── requirements.txt        # Python dependencies
└── .env.example           # Environment template
```

## How it Works

The application uses a Docker-based approach:

1. When started, the container automatically:
   - Clones the Microsoft AutoGen repository
   - Installs Magnetic-One and its dependencies
   - Starts the FastAPI server
2. The web interface communicates with Magnetic-One through the FastAPI backend
3. All dependencies are managed within the Docker container

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

## Security Notes

- Run only in a controlled environment
- Keep API keys and credentials secure
- Consider implementing authentication for shared environments

## License

This project is licensed under the terms of the Microsoft AutoGen repository license.
