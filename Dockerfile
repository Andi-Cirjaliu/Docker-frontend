#Build phase
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build wil have the files that we need

#Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html