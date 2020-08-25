FROM node:14-alpine as builder

# RUN npm install --global yarn

WORKDIR /app
COPY . .
RUN yarn install

WORKDIR /app/packages/session
RUN yarn build

WORKDIR /app/packages/session
RUN yarn build

WORKDIR /app/samples/videoroom
RUN yarn build

ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json

FROM cvs/base-nginx

WORKDIR /app
COPY --from=builder /app/samples/videoroom/build /usr/share/nginx/html

WORKDIR /etc/nginx
CMD ["nginx"]


