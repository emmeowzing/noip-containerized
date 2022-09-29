FROM ubuntu:22.04

ENV USERNAME none
ENV PASSWORD none
ENV HOSTNAME none
ENV INTERVAL 30

USER root

ADD ./scripts/run.sh /

ARG USER_PASSWORD
RUN apt update && apt upgrade -y && apt install -y curl && rm -rf /var/lib/apt/lists/* && \
    groupadd app -g 1000 && \
    useradd app --no-create-home -g 1000 -p "$USER_PASSWORD" && \
    chmod +x ./run.sh && \
    chown app:app ./run.sh

USER app

ENTRYPOINT ["/run.sh"]
