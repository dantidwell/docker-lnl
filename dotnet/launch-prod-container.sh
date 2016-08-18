#clean up any containers/images by the same name
docker kill dotnet-app-prod 2> /dev/null
docker rm dotnet-app-prod 2> /dev/null
docker rmi dotnet-app-prod 2> /dev/null

#restore packages and build for release
dotnet restore && \
dotnet build -c Release && \ 
dotnet publish -o ./dotnetapp

#build the image and then launch a container 
docker build --no-cache=true -f ./Dockerfile-prod -t dotnet-app-prod ./ && \
docker run -d -e DOTNET_ENV=docker -p 3001:80 --name dotnet-app-prod dotnet-app-prod
