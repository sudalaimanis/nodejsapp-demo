# Use the Node.js LTS Alpine version as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install Git to clone the repository
RUN apk add --no-cache git

# Clone the repository
RUN git clone https://github.com/sudalaimanis/nodejsapp-demo.git .

# Install application dependencies
RUN npm install

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
