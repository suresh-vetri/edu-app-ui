# Set the working directory inside the container
WORKDIR /app

# Step 2: Use Nginx to serve the built Angular application
FROM nginx:alpine

# Copy the built Angular files from the previous stage to the Nginx web root
COPY --from=build app/dist/edu-app-ui/browser /usr/share/nginx/html

# Expose port 80 to serve the application
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
