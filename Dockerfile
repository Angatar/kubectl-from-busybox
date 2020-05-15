FROM busybox:latest as helper
MAINTAINER d3fk

RUN  wget --no-check-certificate https://storage.googleapis.com/kubernetes-release/release/$(wget --no-check-certificate -q -O- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod +x kubectl 

FROM scratch
COPY --from=helper /kubectl /kubectl

ENTRYPOINT ["/kubectl"]
CMD ["--help"]
