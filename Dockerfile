# Use the latest Ubuntu image
FROM ubuntu:latest

# Update system and install required packages
RUN apt update -y && \
    apt install -y python3 python3-pip nginx && \
    pip3 install google-adk google-generativeai --break-system-packages

# Copy all files from marketing_campaign_agent
COPY . /app

# Set working directory
WORKDIR /app

# Configure nginx
RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/sites-available/app
RUN ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app

# Expose ports
EXPOSE 80

# Start services
CMD service nginx start && adk web