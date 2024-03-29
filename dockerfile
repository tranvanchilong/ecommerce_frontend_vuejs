# FROM node:lts-alpine as build-stage

# WORKDIR /app

# COPY ./app/package.json .

# RUN npm install

# build stage
# FROM node:16.3.0-alpine
# WORKDIR /app
# COPY ./app/package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# production stage
# FROM nginx as production-stage
# COPY --from=build-stage app/dist /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

FROM node:16.3.0-alpine
WORKDIR /app
COPY ./app/package.json .
RUN  npm install
# RUN npm install -g npm@9.8.1
EXPOSE 8080
CMD ["npm", "run", "serve"]

# FROM nginx as production-stage
# RUN mkdir /app
# COPY --from=build-stage /app/dist /app
# COPY nginx.conf /etc/nginx/nginx.conf

# Use the official Node.js image with a specific version
# FROM node:16.3.0-alpine
# WORKDIR /app
# COPY ./app/package.json .
# COPY ./app/package-lock.json .
# RUN npm install
# RUN npm uninstall -g @vue/cli
# RUN npm install -g @vue/cli
# EXPOSE 8080
# CMD ["npm", "run", "serve"]