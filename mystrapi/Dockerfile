FROM node:16
# Installing libvips-dev for sharp compatability
RUN apt-get -yq update && apt-get -yq install libvips-dev
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./
#COPY ./yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g
RUN yarn install
WORKDIR /opt/app
COPY ./ .
RUN yarn build

RUN mkdir /root/appbck
RUN cp -a /opt/app/* /root/appbck
#RUN cp /opt/app/.* /root/appbck

EXPOSE 1337
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
#CMD ["yarn", "develop"]