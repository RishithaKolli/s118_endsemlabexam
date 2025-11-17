# -------------------------------
# Stage 1: Development / Vite Dev Server
# -------------------------------

# Use Node.js (Alpine for lightweight image)
FROM node:20-alpine

# Set the working directory inside container
WORKDIR /app

# Copy package.json & package-lock.json first (better caching)
COPY package*.json ./

# Install node modules
RUN npm install

# Copy all project files into container
COPY . .

# Vite uses port 5173
EXPOSE 5173

# Run Vite dev server with --host to allow external access
CMD ["npm", "run", "dev", "--", "--host"]
