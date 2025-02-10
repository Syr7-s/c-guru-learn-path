# Python Web Application

A simple Python web application built with Flask framework that displays a "Hello, World!" message. This application is containerized and ready to be deployed on Google Kubernetes Engine (GKE).

## Features

- Basic Flask web server
- Docker containerization
- Kubernetes deployment ready

## Usage

### Local Development

```bash
# Run the application locally
python app.py
```

### Docker

```bash
# Build the Docker image
docker build -t py-app-1 .

# Run the container
docker run -p 5000:5000 py-app-1
```

### Kubernetes

The application can be deployed to GKE using the provided Kubernetes manifests.

## Requirements

- Python 3.x
- Flask
- Docker
- kubectl (for Kubernetes deployment)
