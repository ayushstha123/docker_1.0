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


### To run Docker Image
`docker run imageName:version