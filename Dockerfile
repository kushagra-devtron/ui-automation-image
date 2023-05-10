# Use the official Ubuntu 20.04 LTS image as the base image
#FROM ubuntu:20.04
FROM node

# Install the latest version of Node.js and npm
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install tzdata -yq
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
RUN cd /sourcecode/dashboard-automation/
RUN npm install -D @playwright/test
RUN npx playwright install
RUN npx playwright install-deps 
