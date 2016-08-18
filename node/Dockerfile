#start with the official node.js base image
FROM node

#copy the source into the image
COPY ./ /usr/src/app

#set the current working directory to the root source folder
WORKDIR /usr/src/app

#install dependencies
RUN npm install

#expose port 80 when the image is run in a container
EXPOSE 80

#run '$ npm start' on container launch 
CMD ['npm', 'start']


