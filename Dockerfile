FROM debian:stable
USER root

RUN apt-get update
RUN apt-get -y upgrade

RUN apt install -y automake make libtool libusb-1.0-0-dev libjack-jackd2-dev libsamplerate0-dev libsndfile1-dev autopoint gettext libjson-glib-dev libgtk-3-dev

WORKDIR /build

COPY ./overwitch /build

RUN autoreconf --install
RUN ./configure 
RUN make
RUN make DESTDIR="/build/aarch64" install
RUN ldconfig

CMD ["echo", "Done build."]