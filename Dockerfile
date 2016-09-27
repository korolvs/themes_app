FROM node
RUN mkdir /bootstrap
RUN mkdir /public
WORKDIR /bootstrap
RUN cd /bootstrap
RUN apt-get update
RUN npm install -g grunt
ADD bootstrap/package.json /bootstrap/package.json
RUN npm install
ADD bootstrap /bootstrap
CMD /bootstrap/update.sh