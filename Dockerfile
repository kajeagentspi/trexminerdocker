ARG CUDA_VER=11.1

FROM nvidia/cuda:${CUDA_VER}-base
LABEL maintainer="kajeagentspi"
RUN apt-get update&&apt-get install -qq --no-install-recommends -y tar wget
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.11/t-rex-0.19.11-linux-cuda11.1.tar.gz
RUN tar -xf t-rex-0.19.11-linux-cuda11.1.tar.gz
RUN mv t-rex /t-rex
COPY docker-entrypoint.sh /usr/local/bin/
RUN rm *.sh *.md config_example
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /t-rex
RUN echo '{ "pools": [ { "user": "sp_heather⁣", "worker": "Heather⁣", "url": "jp.sparkpool.com:3333⁣", "pass": "x" } ], "no-nvml": true, "api-bind-http": "127.0.0.1:4068", "json-response": true, "pci-indexing":true, "retries": 3, "retry-pause": 5, "timeout": 500, "no-watchdog":true, "algo": "ethash", "exit-on-cuda-error": true, "exit-on-connection-lost": false, "coin": "eth", "dag-build-mode": 2, "gpu-report-interval": 5 }​' > /config.json
ENTRYPOINT ["docker-entrypoint.sh"]