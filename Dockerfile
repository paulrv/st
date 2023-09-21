
FROM archlinux:latest
RUN pacman --noconfirm -Syu simutrans simutrans-pak128 rclone gnu-netcat && \
pacman --noconfirm -Scc && \
mkdir -p /.cache && chgrp -R 0 /usr/share/games /.cache && \
chmod -R g=u /usr/share/games /.cache
VOLUME /usr/share/games/simutrans/save
EXPOSE 13353

CMD simutrans -log 1 -debug 2 -server 13353 -singleuser -lang en -load network1 -set_workdir /usr/share/games/simutrans -use_workdir /usr/share/games/simutrans
