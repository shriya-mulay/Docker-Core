# Docker-Core
An easy way to setup environment to analyze gluster coredump files


# Requirements :
 Docker must be installed

- This Dockerfile by default uses rhel 7.5, if you want some specific version, do make changes in the Dockerfile

 for example, if you want rhel7.2 image then simply change the `FROM` field
~~~
FROM rhel7.2
~~~

- You must use `yum.repos.d` directory from the sos-report provided

Just copy the directory from the sos-report to the folder 

~~~
cp -r path-to-sos-report/etc/yum.repos.d path-to-Docker-Core/ 
~~~

- Follow the steps as below :

1. Make sure you have the files in the same directory

2. Build the Docker image
~~~
docker build -t name /path-where-Dockerfile-exists
~~~
3. Once your image is built, now it's time to run it
here we are mounting the *Dir* from the base machine to the /core directory of the container

~~~
#this command will make the container run in the background
docker run -it -v /Dir/:/core/:Z -d name-of-the-image

#to check running containers
docker ps

#use this command to enter the running container
docker exec -it <PID of that container> bash
~~~
*Dir is a directory where all the files specified below exist*
Make sure you have following files in the same directory
- script.sh
- installed-rpms
- Dockerfile
- core file
- yum.repos.d directory (copied from sos-report)

this will create a new container from the image we have previously built

4. The file `script.sh` will install all the packages that are needed to analyaze the gluster coredump core file from the `installed-rpms` file we have provided in the above command
run script.sh once you enter inside the container
~~~
cd /core

sh script.sh
~~~
5. after installation is finshed, the setup is ready to use 

~~~
gdb /path corefile
~~~
