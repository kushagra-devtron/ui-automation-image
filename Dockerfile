FROM node

# Install the latest version of Node.js and npm
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -yq tzdata fonts-noto && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt update && \
    apt install -yq \
    fonts-noto \
    libx264-160 \
    libenchant-2-2 \
    libicu67 \
    libjpeg-turbo8 \
    libvpx7 \
    libwebp6 && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /sourcecode/dashboard-automation/

COPY . .

RUN npm install -D @playwright/test && \
    npx playwright install && \
    npx playwright install-deps
