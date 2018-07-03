# dayflower/build-ubuntu-mozc-ut2-neologd

Docker image which includes mozc-ut2-neologd packages for Ubuntu 18.04.

If you want to copy deb packages to a host environment, you can mount volume `/mozc/deb` as follows.

    $ docker run -v LOCAL_STORE:/mozc/deb dayflower/build-ubuntu-mozc-ut2-neologd
