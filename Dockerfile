FROM ubuntu:latest
#Setup Environment
ENV APIFileName bot.py
ENV Pip_Depenendcies "iperf3" 
ENV Apt_Dependencies "iperf3"
VOLUME ["/mnt/APIServer"]
WORKDIR /mnt/APIServer

#Install Deps
RUN apt-get update && apt-get -y install sudo
RUN sudo apt install -y python3 python3-pip curl
RUN sudo apt install -y ${Apt_Dependencies}
RUN pip3 install -U pip
RUN sudo apt update
RUN pip3 install requests pytz simplejson Flask flask
RUN pip3 install ${Pip_Depenendcies}
RUN pip3 install -U Flask
RUN sudo apt update

RUN echo "Installed Depenendcies"

#Run Bot
CMD python3 ${APIFileName}