# Use the same Node.js version as the one installed on your system
FROM node:20.11.1

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY client/package*.json ./client/
COPY server/package*.json ./server/

# Install dependencies for both client and server
RUN cd client && npm install
RUN cd server && npm install

# Copy the entire project to the working directory
COPY . .

# Copy built frontend files to Nginx server directory
RUN cp -a client/build/. /usr/share/nginx/html/

# Expose port 5001 for the Express server
EXPOSE 5001

# Command to start the Express server
CMD ["node", "server/server.js"]
