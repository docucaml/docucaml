FROM ocaml/opam2
COPY setup1.sh /home/opam/setup1.sh
COPY setup2.sh /home/opam/setup2.sh
COPY setup3.sh /home/opam/setup3.sh
RUN /home/opam/setup1.sh
RUN /home/opam/setup3.sh
RUN /home/opam/setup2.sh
WORKDIR /docucaml
