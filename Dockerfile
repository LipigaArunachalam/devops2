# Use full Node.js image to avoid Alpine-related issues
FROM node:20 

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json before installing dependencies
COPY package.json package-lock.json /app/

# Clean cache and install dependencies
RUN npm cache clean --force
RUN npm install

# Copy the entire project
COPY . .

# Build the React app
RUN npm run build

# Install a static server to serve the React app
RUN npm install -g serve

# Expose the correct port
EXPOSE 4000

# Serve the built React app
CMD ["serve", "-s", "build", "-l", "4000"]
