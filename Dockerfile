FROM node:12-alpine
RUN npm install react-scripts

COPY . .

RUN npm start

CMD ["node","src/index.js"]
EXPOSE 3000

RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz