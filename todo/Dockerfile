# Use an official Node runtime as the parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source inside the Docker image
COPY . .

# Your app binds to port 3000, so use the EXPOSE instruction to have it mapped
EXPOSE 3000

# Define the command to run your app
CMD [ "node", "app/server.js" ]
