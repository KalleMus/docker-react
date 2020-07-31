# Build phase
FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .
RUN npm i
COPY . .

RUN npm build 
# /app/build

# Run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
