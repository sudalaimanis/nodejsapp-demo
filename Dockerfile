FROM node:18-alpine AS builder
WORKDIR /build/
RUN apk add --no-cache git
RUN git clone https://github.com/sudalaimanis/nodejsapp-demo.git .
RUN npm install

FROM node:18-alpine
WORKDIR /usr/src/app
COPY --from=builder /build/ /usr/src/app
EXPOSE 3000
CMD ["npm", "start"]
