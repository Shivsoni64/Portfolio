FROM nginx: latest
COPY . /usr/share/nginx/html

# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Install dependencies
RUN npm install

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the app when the container launches
CMD ["node", "app.js"]
