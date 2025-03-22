# Use Node.js as the base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the project files
COPY . .

# Build the React app
RUN npm run build

# Install a simple HTTP server to serve the build
RUN npm install -g serve

# Expose port 3003
EXPOSE 3003

# Start the app
CMD ["serve", "-s", "build", "-l", "3003"]

