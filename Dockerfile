ARG CUDA_VER=11.1

FROM nvidia/cuda:${CUDA_VER}-base
LABEL maintainer="kajeagentspi"
RUN apt-get update&&apt-get install -qq --no-install-recommends -y tar wget
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.11/t-rex-0.19.11-linux-cuda11.1.tar.gz
RUN tar -xf t-rex-0.19.11-linux-cuda11.1.tar.gz
RUN rm *.sh *.md config_example
RUN chmod +x /t-rex
RUN mv /t-rex /trex
ENTRYPOINT ["/trex"]
