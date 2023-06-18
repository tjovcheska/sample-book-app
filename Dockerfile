FROM node:20

WORKDIR /app
COPY package.json package.json
COPY index.js index.js
COPY index.test.js index.test.js

RUN npm install

EXPOSE 1050

ENTRYPOINT ["node"]
CMD ["index.js"]
# node index.js