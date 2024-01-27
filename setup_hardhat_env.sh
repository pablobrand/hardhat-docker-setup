#!/bin/bash

# Define variables
DOCKER_USERNAME="pablodocker2019"
IMAGE_NAME="hardhat_env"
CONTAINER_NAME="hardhat_dev"

# Function to check if Docker is installed
function check_docker_installed {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Error: Docker is not installed." >&2
        exit 1
    fi
}

# Function to build the Docker image
function build_image {
    echo "Building Docker image..."
    docker build -t $DOCKER_USERNAME/$IMAGE_NAME .
    echo "Docker image built successfully."
}

# Function to run the Docker container
function run_container {
    echo "Running Docker container..."
    docker run -it --name $CONTAINER_NAME $DOCKER_USERNAME/$IMAGE_NAME
}

# Main script execution
check_docker_installed
build_image
run_container
