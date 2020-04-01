FROM python:3.7-slim

RUN apt-get update && apt-get install -y build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev virtualenv && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/ebcli

WORKDIR /root/ebcli

COPY . /root/ebcli

RUN python scripts/ebcli_installer.py --version 3.14.13

ENV PATH="/root/.ebcli-virtual-env/executables:$PATH"

WORKDIR /root/workspace

ENTRYPOINT ["eb"]
