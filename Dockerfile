# Use an official Python runtime as the base image
FROM python:3.9

# # Use an ubuntu runtime as the base image
# FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./app /app

# Install any dependencies
RUN chmod +x /app/install_dependencies.sh
RUN /app/install_dependencies.sh

# Expose the port that your application runs on
EXPOSE 8000

# Run the server
CMD ["python", "/app/app.py"]

