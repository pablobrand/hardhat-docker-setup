# Prefered Nodejs image 
FROM node:lts-alpine3.19

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Set the default command for the container
CMD ["npx", "hardhat", "test"]
