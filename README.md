# docker-technicpack-minecraft
A simple dockerfile to start up TechnicPack servers

# What is this?

I build (stole) this Dockerfile to help start up a minecraft server on *Amazon EC2* or other environments that support containers. You can also use it to start a server on your own machine using [Docker][0]

# How to run

    sudo docker run --name technicpack -p 25565:25565 snizzmo/docker-technicpack

[0]: https://www.docker.com/
