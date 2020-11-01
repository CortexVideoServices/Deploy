Deployment tools
================
In this repository, you can find the Dockerfile and docker-compose files 
to help you deploy sample applications. It can also be a good example for 
your own application based on the Cortex Video Services.

Get started
-----------

At first you need clone this repo:

    git clone https://github.com/CortexVideoServices/Deploy.git ./cvs
    cd ./cvs
    git submodule init

It contains repositories of other platform elements as git submodules that 
are used to build the Docker images needed to deploy the application stack.
Therefore, every time before building images, you need to update the submodules:

    git submodule update --remote

In order for the build images to run on a real server, you need: the 
associated hostname, the associated SSL certificate and its private key, 
stored in the PEM file. The certificate file must contain [the complete 
certificate trust chain]. Create a docker-compose override file with this 
information (fill sections: `SERVERNAME`, `FULLCHAIN_PEM`, `PRIVKEY_PEM`), 
for example you can see [base.sample-prod.yaml].

You also need to create the files `server.prod.yaml` and` videoroom.prod.yaml` 
with your own parameters for connecting to the database, parameters for connecting 
to the mailer and JWT key. An example of the contents of the files can be found in 
[server.sample-prod.yaml], [videoroom.sample-prod.yaml].

The next step is to build images:

    docker-compose -f base/docker-compose.yaml -f base.prod.yaml build
    docker-compose -f others/Server/docker-compose.yaml -f server.prod.yaml build
    docker-compose -f others/Server/docker-compose.yaml -f videoroom.prod.yaml build

Then just run the following command to launch the docker containers.

    PUBLIC_IP=`hostname -I | awk '{print $1}'` \
    docker-compose -f Docker/server/docker-compose.yaml \
                   -f Docker/videoroom/docker-compose.yaml up -d

[the complete certificate trust chain]: https://www.digicert.com/kb/ssl-support/pem-ssl-creation.htm
[base.sample-prod.yaml]: ./base.sample-prod.yaml
[server.sample-prod.yaml]: ./server.sample-prod.yaml
[videoroom.sample-prod.yaml]: ./videoroom.sample-prod.yaml