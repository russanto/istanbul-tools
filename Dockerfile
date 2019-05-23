FROM golang:latest as builder
RUN mkdir istanbul-tools
COPY . istanbul-tools
WORKDIR /go/istanbul-tools
RUN make

FROM debian
COPY --from=builder /go/istanbul-tools/build/bin/istanbul /usr/bin
WORKDIR /root
ENTRYPOINT ["istanbul"]