#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <arpa/inet.h>

#define CLIENT_BUFFER_SIZE 4096

#ifdef PROD
  #define PORT 80
#else
  #define PORT 3002
#endif

int main(int argc, char ** argv) { 
  int serverSockHandle; 
  int clientSockHandle;
  int sockAddressSize;

  struct sockaddr_in serverAddress; 
  struct sockaddr_in clientAddress;

  char clientBuffer[CLIENT_BUFFER_SIZE];
  char clientMessage[] = "Hello, World\n";

  serverSockHandle = socket(AF_INET, SOCK_STREAM, 0);
  serverAddress.sin_family = AF_INET; 
  serverAddress.sin_addr.s_addr = INADDR_ANY;
  serverAddress.sin_port = htons(PORT);

  sockAddressSize = sizeof(struct sockaddr_in);
  bind(serverSockHandle, (struct sockaddr *)&serverAddress, sizeof(serverAddress));
  listen(serverSockHandle, 3);

  clientSockHandle = accept(serverSockHandle, (struct sockaddr*)&clientAddress, (socklen_t*)&sockAddressSize);

  int bytesRead = 0;
  while((bytesRead=recv(clientSockHandle, clientBuffer, CLIENT_BUFFER_SIZE, 0)) > 0) { 
    write(clientSockHandle, clientMessage, strlen(clientMessage));
  }
  return 0;
}