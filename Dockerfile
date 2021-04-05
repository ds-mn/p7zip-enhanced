FROM buildpack-deps:stable-scm

RUN set -ex ;\
    apt-get update ;\
    apt-get install -y g++ make pv;\
    git clone https://github.com/jinfeihan57/p7zip.git ;\
    cd p7zip ;\
    make -j3 7z 7za 7zr sfx ;\
    ./install.sh ;\
    7za i ;\
    cd / ;\
    rm -rf /p7zip ;\
    apt-get autoremove --purge -y g++ make;\
    rm -rf /var/lib/apt/lists/*
