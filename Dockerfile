FROM docker:latest

RUN apk add --no-cache \
    bash \
    curl \
    git

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64

RUN chmod +x ./kind

RUN mv ./kind /usr/local/bin/kind

ENTRYPOINT [ "bash" ]
