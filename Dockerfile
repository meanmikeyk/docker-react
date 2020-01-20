FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
copy . . 
#This will create /app/build
RUN npm build

## SECOND PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
## This container already knows to execute nginx
