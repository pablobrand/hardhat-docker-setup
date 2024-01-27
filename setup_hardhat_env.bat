@echo off

REM Define variables
set DOCKER_USERNAME="pablodocker2019"
set IMAGE_NAME="hardhat_env"
set CONTAINER_NAME="hardhat_dev"

REM Check if Docker is installed
call :check_docker_installed

REM Build Docker image
call :build_image

REM Run Docker container
call :run_container

REM Exit the script
goto :eof

REM Function to check if Docker is installed
:check_docker_installed
docker -v >nul 2>&1 || (
    echo Error: Docker is not installed.
    exit /b 1
)
goto :eof

REM Function to build the Docker image
:build_image
echo Building Docker image...
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME% .
echo Docker image built successfully.
goto :eof

REM Function to run the Docker container
:run_container
echo Checking if container %CONTAINER_NAME% exists ...
docker ps -aq -f name=^/%CONTAINER_NAME% >nul 2>&1 && (
    echo Removing existing container...
    docker rm -f %CONTAINER_NAME%
)

echo Running Docker container...
docker run -it --name %CONTAINER_NAME% %DOCKER_USERNAME%/%IMAGE_NAME%
goto :eof