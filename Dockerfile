FROM rhel7.5
MAINTAINER "mulayshriya@gmail.com sam.kandarkar@gmail.com"
ADD yum.repos.d /etc/yum.repos.d/
ADD	n.sh	n.sh
RUN  ./n.sh  

