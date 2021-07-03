FROM thewtex/opengl:ubuntu2004
COPY ./copy-client-files.sh /copy-client-files.sh
RUN apt-get update && \
    apt-get install -y libsdl1.2debian libsdl-image1.2 zlib1g libogg0 libvorbis0a libopenal1 libcurl4 && \
    /copy-client-files.sh && \
    rm /copy-client-files.sh && \
    chmod +x /ac-client/assaultcube.sh &&\
    mkdir /home/user/work
ENV APP /ac-client/assaultcube.sh
