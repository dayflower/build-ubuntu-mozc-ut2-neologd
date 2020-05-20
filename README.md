# dayflower/build-ubuntu-mozc-ut2-neologd

Docker image which includes mozc-ut2-neologd packages for Ubuntu 20.04 (Focal).

If you want to copy deb packages to a host environment:

    $ docker run --name mozc-ut2 dayflower/build-ubuntu-mozc-ut2-neologd
    $ docker cp mozc-ut2:/mozc/deb .
