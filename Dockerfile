FROM node:alpine as buildertest

WORKDIR '/apptestsup'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=buildertest /apptestsup/build /usr/share/nginx/html