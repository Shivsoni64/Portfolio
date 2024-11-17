# Use the Nginx image from Docker Hub
FROM nginx

# Copy the HTML and CSS files into the default Nginx serve directory
COPY . /usr/share/nginx/html/
