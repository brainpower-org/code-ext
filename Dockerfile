FROM ubuntu:18.10

RUN apt-get update && apt-get install -y apt-transport-https curl gpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
 && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
RUN apt-get update && apt-get install -y code libx11-xcb-dev libasound2

ADD ext /usr/bin/
