FROM node:alpine as build

RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers autoconf automake make nasm python git && \
  npm install --quiet node-gyp -g

WORKDIR /home/app/
COPY package* /home/app/ 

RUN npm install --production 

COPY . /home/app/

FROM node:alpine

RUN apk --no-cache add postgresql-client netcat-openbsd

COPY --from=build /home/app/ /home/app/ 

EXPOSE 3000

WORKDIR /home/app/
CMD ./start.sh
