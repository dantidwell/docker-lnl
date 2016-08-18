#clean up any containers/images by the same name
docker kill dotnet-app-dev 2> /dev/null
docker rm dotnet-app-dev 2> /dev/null
docker rmi dotnet-app-dev 2> /dev/null

#build the image and then launch a container 
docker build --no-cache=true -f ./Dockerfile-dev -t dotnet-app-dev ./ && \
docker run -d -e DOTNET_ENV=docker -p 3001:80 --name dotnet-app-dev dotnet-app-dev
