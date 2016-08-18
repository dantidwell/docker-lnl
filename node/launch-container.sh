#clean up any containers/images by the same name
docker kill node-app && \
docker rm node-app && \
docker rmi node-app && \
#build the image and then launch a container 
docker build --no-cache=true -t node-app ./ && \
docker run -d -e NODE_ENV=docker -p 3000:80 --name node-app node-app
