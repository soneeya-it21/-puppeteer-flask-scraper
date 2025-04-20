# --- Stage 1: Node.js Scraper ---
FROM node:18-slim AS scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Install Chromium and dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY scraper/package*.json ./
RUN npm install

COPY scraper/scrape.js .

# Set environment variable for URL
ARG SCRAPE_URL
ENV SCRAPE_URL=${SCRAPE_URL}

# Run the scraper
RUN node scrape.js

# --- Stage 2: Python Flask Server ---
FROM python:3.10-slim AS final

WORKDIR /app

COPY --from=scraper /app/scraped_data.json ./scraped_data.json
COPY server.py .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "server.py"]
