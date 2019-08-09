FROM ocaml/opam2
RUN sudo apt update && \
    sudo apt install -y npm m4 && \
    sudo npm install npm@latest -g && \
    sudo npm cache clean -f && \
    sudo npm install -g n && \
    sudo n stable
RUN sudo npm install -g esy --unsafe-perm
RUN opam update && \
    opam install odig
