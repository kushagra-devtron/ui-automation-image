# Use the official Ubuntu 20.04 LTS image as the base image
FROM ubuntu:20.04

# Install the latest version of Node.js and npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Clone the remote Git repository
RUN git clone <repository-url>

# Install the project dependencies
RUN cd <project-directory> && npm install

# Set the command to run when the container starts
CMD ["node", "<project-directory>/index.js"]
