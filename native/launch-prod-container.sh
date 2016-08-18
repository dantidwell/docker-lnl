#clean up any containers/images by the same name
docker kill native-app-prod 2> /dev/null
docker rm native-app-prod 2> /dev/null
docker rmi native-app-prod 2> /dev/null

rm -rf ./bin && \
mkdir -p ./bin && \
gcc -static native-app.c -o native-app && \
mv native-app ./bin/native-app

docker build -f ./Dockerfile-prod --no-cache=true -t native-app-prod ./
docker run --name native-app-prod native-app-prod