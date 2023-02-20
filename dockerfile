FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    jq \
    git \
    curl \
    wget \
    ffmpeg \
    bpm-tools \
    opus-tools \
    python3-pip \
    python-is-python3
RUN curl -s https://deb.nodesource.com/setup_16.x | bash
RUN apt-get update && apt-get install nodejs -y
RUN git clone https://github.com/magneum/premiumdlbkd
RUN cd premiumdlbkd
WORKDIR /premiumdlbkd
RUN yarn global add spotify-dl spdl-core forever
RUN rm -f yarn.lock && yarn install 
CMD [ "yarn", "start" ]
