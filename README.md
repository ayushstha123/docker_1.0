# Docker
Docker is an open platform that enables developers to build and ship and run application in an isolated environment called containers. It provides standarized way to package an application and its dependencies

### what is container
Containers are isolated environment. Containers are isolated processes for each of your app's components. Each component - the frontend React app, the Python API engine, and the database - runs in its own isolated environment, completely isolated from everything else on your machine

### what is Image 
Images are standarized packages that include all the files , binaries , os packages that needs to be run in the containerized environment. Once its created it cannot be changed , its immutable

### Docker hub -> Means it has configurations thats already written . 
Lets say ki malai node halnu mann lagyo i go to docker to look at the images available and in my docker file `(Dockerfile)` i write this command :

> FROM "node:24-alpine3.21"
This sets the base image for your Docker image. It uses the Node.js version 24 with the lightweight Alpine Linux version 3.21. This ensures your container has Node.js pre-installed.


> WORKDIR /app
This sets the working directory inside the container to /app. All subsequent commands in the Dockerfile will be executed relative to this directory.


> COPY . .
This copies all files from your current directory (on your host machine) into the /app directory inside the container.


> CMD ["npm","run","start:dev"]
This specifies the default command to run when the container starts. Here, it runs npm run start:dev, which is likely a script defined in your package.json file.

#### To see the images we have build
`docker images` or `docker image ls`

#### To delete a image 
`docker rmi imageid`

#### if i have a abc folder and my docker file is outside that folder
In my docker file inside COPY command i have to put
`COPY abc/* .`

#### to add tagname in docker images
`docker build . -t tagname:version`


#### To run Docker Image
`docker run imageName:version`


#### To show Docker container
`docker container ls`


#### To show Docker container hidden lists
`docker container ls -a`

#### To run a new Docker container and open an interactive shell session inside that container 
`docker run -it imageID /bin/sh`

#### To forcefully delete a docker images  
`docker rmi -f myNode:1.0`

### Setting up environment Variables
1. On Run time 
set environment variables when you launch a container using the docker run command. This is useful for sensitive information (like API keys) or configuration that might change between different deployments (e.g., development vs. production).

```
docker run -e NODE_ENV=production imageName:version
```

2. On docker file 
This is the most common way to bake environment variables directly into your Docker image. You use the ENV instruction in your Dockerfile.
`ENV NODE_ENV=production`

3. By giving the location of env file
We can give the location of our env file in the lauch of a container that use the docker run command 
`docker run --env-file=fileName imageName`

### to watch the history of your previous instances 
`docker container ls -a`

### to remove all the image in one go
`docker image rm $(docker image ls -q)`
docker image ls -q lists all the id of the images thats available in your workstation


### to remove container from id 
`docker rm containerID`


### Docker container life cycle
1. Created: This is the initial state when you run docker create. A container is created from an image, but it's not yet running. It has a file system and configuration, but no processes are active.

2. Running: When you start a created container using docker start or directly create and run it using docker run, it enters the running state. The main process defined in the container's image (e.g., CMD or ENTRYPOINT in the Dockerfile) is executed.

3. Paused: You can temporarily suspend a running container using docker pause. This freezes all processes within the container, but its state is preserved in memory. It's still considered active but not executing.

4. Unpaused: To resume a paused container, you use docker unpause. This brings the container back to the running state, and its processes continue from where they left off.

5. Stopped: A running container can be stopped using docker stop. This sends a SIGTERM signal to the main process, allowing it to shut down gracefully. If the process doesn't exit within a timeout, a SIGKILL is sent. A stopped container's state is preserved on disk, meaning you can restart it later, and it will resume from its last saved state (unless volumes are involved).

6. Exited: A container enters the exited state when its main process finishes execution (either successfully or due to an error) or when it's explicitly stopped. An exited container still exists on the system and can be inspected, restarted, or removed.

### Running docker image using express
so we can run our express server in docker environment by Tweaking our Dockerfile
```
FROM "node:24-alpine3.21"

WORKDIR /app

COPY package.json .

RUN npm install

COPY . . 

CMD ["npm","run","start:dev"]
```

and after that we need to port mapping in our pc 
`docker run -p 4000:4000 fbc88fed32c3`

### To stop the running container
`docker ps -a` to list and to delete the container or stop the container you use `docker stop containerID`