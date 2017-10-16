FROM ruby:2.4.2

# variables for docker container environment
ARG USER_ID
ARG APP_HOME




RUN apt-get update -qq && apt-get install -y build-essential

# for a JS runtime
RUN apt-get install -y nodejs


RUN apt-get update && apt-get install -y sudo

RUN export uid=$USER_ID && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:0:developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:0 -R /home/developer

USER developer



#install rails
RUN gem install rails

RUN sudo mkdir /home/developer/$APP_HOME
ADD ./registroDeudas /home/developer/$APP_HOME

WORKDIR /home/developer/$APP_HOME

RUN bundle install

