# Stage 1: Build the app using Node.js
FROM node:14-alpine AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Install dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3000

# Run the app when the container launches (optional for this stage)
CMD ["npm", "start"]

# Stage 2: Use Nginx to serve the app
FROM nginx:latest

# Copy the build output from the first stage into the Nginx container
COPY --from=build /usr/src/app /usr/share/nginx/html

# Expose port 80 for the Nginx server
EXPOSE 80

# Start Nginx (default command for the nginx image)
CMD ["nginx", "-g", "daemon off;"]
