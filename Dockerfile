# Use Node.js Alpine base image to build React
FROM node:alpine as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . . 

RUN npm run build

# Use Nginx for production server
FROM nginx:alpine

# Copy React build files to Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for serving the React app
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
