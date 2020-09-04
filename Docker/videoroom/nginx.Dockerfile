FROM node:14-alpine as builder

WORKDIR /app
COPY sample .
RUN yarn install
ENV PATH /app/node_modules/.bin:$PATH
RUN yarn build


FROM cvs/base-nginx
COPY --from=builder /app/build /usr/share/nginx/html

WORKDIR /etc/nginx
CMD ["nginx"]


