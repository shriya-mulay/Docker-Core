# Docker-Core
An easy way to setup environment to analyze gluster coredump files


# Requirements :
1. Docker must be installed

Make sure the Dockerfile and n.sh are in the same directory.

In order to install the packages inside the conatiner, you must have a `installed-rpms` and `core` file from sosreport in the same directory

This Dockerfile by default uses rhel 7.5, if you want some specific version, do make changes in the Dockerfile
-
 for example, if you want rhel7.2 conatiner then simply change the `FROM` field
~~~
FROM rhel7.2
~~~

You need to follow the steps as below :
1. Make sure you have the files in the same directory
2. Build the Docker conatiner
~~~
docker build -t conatiner-name /path-where-dockerfile-exists
~~~
3. Once your container is built, now it's time to run it

~~~
docker run -it -v /dir-path/installed-rpms:/dir-path/installed-rpms:Z container-name bash
~~~

this will create a new container from the image we have previously built

4. The file `n.sh` will install all the packages that are needed to analyaze the gluster coredump core file from the `installed-rpms` file we have provided in the above command
