# -----------------------------------------------------------------------------
# docker-minecraft
#
# Builds a basic docker image that can run a Minecraft server
# (http://minecraft.net/).
#
# Authors: Carsten Ringe
# Updated: Sep 13th, 2015
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------


# Base system is the LTS version of Ubuntu.
FROM	ubuntu

# 25565 is for minecraft
EXPOSE	25565

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Download and install everything from the repos.
RUN    apt-get --quiet --yes update && apt-get --quiet --yes upgrade && apt-get --quiet --yes clean
RUN    apt-get --quiet --yes install curl unzip openjdk-7-jre-headless && apt-get --quiet --yes clean

# create defalt directory
RUN	mkdir /data
WORKDIR	/data

# Load in all of our config files.
ADD	ops.json /data/
ADD	whitelist.json /data/

# download technicpack
RUN	curl -s "https://servers.technicpack.net/Technic/servers/hexxit-2/Hexxit-II_Server_v1.4.4.zip" -o /data/Hexxit-II_Server_v1.4.4.zip
#ADD	Hexxit-II_Server_v1.4.4.zip Hexxit-II_Server_v1.4.4.zip
RUN	unzip Hexxit-II_Server_v1.4.4.zip && rm Hexxit-II_Server_v1.4.4.zip

# disable mods
RUN	mkdir -p mods/disabled
#RUN	mv mods/morph*.zip mods/disabled/

# Fix all permissions
RUN    chmod +x launch.sh

# /start runs it.
CMD    ["./launch.sh"]

