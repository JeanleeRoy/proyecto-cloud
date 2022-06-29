FROM node:16.15.1-alpine3.16
COPY . .
RUN npm install
CMD [ "node", "index.js" ]
