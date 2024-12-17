# Use Node.js 18 as the base image instead of Node.js 16
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Install serve globally to serve the built app
RUN npm install -g serve

# Expose the port that the app will run on
EXPOSE 3000

# Command to serve the application
CMD ["serve", "-s", "dist", "-l", "3000"]
