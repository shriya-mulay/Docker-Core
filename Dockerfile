#change this field for a specific version of an OS that you might need
FROM rhel7.5
MAINTAINER "mulayshriya@gmail.com sam.kandarkar@gmail.com"
#copy yum.repos.d folder from the system where the crash happened,this folder should be in the same one as Dockerfile or specify the full path
ADD yum.repos.d /etc/yum.repos.d/   
#script.sh should be in same folder as Dockerfile or specify the full path

