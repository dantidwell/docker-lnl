docker build --no-cache -t node-app ./ && \
docker run -d -e NODE_ENV=docker -p 3000:80 --name node-app node-app
