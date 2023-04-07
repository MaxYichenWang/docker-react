# Step 1: Install dependencies and run `npm run build`
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Step 2: Copy build files from the output of Step 1 and start nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html