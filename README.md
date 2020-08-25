# Deployment tools
In this repository, you can find the Dockerfile and docker-compose files 
to help you deploy sample applications. It can also be a good example for 
your own application based on the Cortex Video Services.

### VideoRoom
This is a sample application that demonstrates the video chat capabilities 
to you. It's ready to run into docker containers. The following commands 
will help you with this. 

    docker-compose -f base/docker-compose.yaml build
    docker-compose -f videoroom/docker-compose.yaml build
    docker-compose -f videoroom/docker-compose.yaml up -d

    