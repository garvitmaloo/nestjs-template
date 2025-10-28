# Use a lightweight Node image
FROM node:24-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy only package files first for caching npm install
COPY package*.json ./

# Install all dependencies (dev included)
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Expose the NestJS default port
EXPOSE 3000

# Run in development mode with hot reload
CMD ["npm", "run", "start:dev"]
